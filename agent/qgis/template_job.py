"""PyQGIS job template. Copy to <job>/work/NN-step.py, edit the STEPS section, then run:
    bash agent/qgis/run_pyqgis.sh <job> work/NN-step.py

Works both headless (QGIS's own python) and inside the GUI (QGIS --code). Paths are relative to the job folder.
The Processing algorithm ids and parameters match tools/qgis/processing-algorithms-reference.md.
"""
import os
import sys

from qgis.core import (
    QgsApplication, QgsProject, QgsVectorLayer, QgsRasterLayer, QgsCoordinateReferenceSystem,
    QgsPrintLayout, QgsLayoutItemMap, QgsLayoutItemLegend, QgsLayoutItemScaleBar, QgsLayoutItemLabel,
    QgsLayoutItemPicture, QgsLayoutPoint, QgsLayoutSize, QgsUnitTypes, QgsLayoutExporter, QgsRectangle,
    QgsVectorFileWriter, QgsCoordinateTransformContext,
)

JOB = os.environ.get("AGENT_JOB", os.getcwd())
os.chdir(JOB)

# ---------------------------------------------------------------- start QGIS + Processing
_own_app = QgsApplication.instance() is None
if _own_app:
    app = QgsApplication([], False)
    app.initQgis()
for _plugins in (os.path.join(QgsApplication.prefixPath(), "..", "Resources", "qgis", "python", "plugins"),
                 os.path.join(QgsApplication.prefixPath(), "..", "Resources", "python", "plugins")):
    if os.path.isdir(_plugins) and _plugins not in sys.path:
        sys.path.append(_plugins)
import processing  # noqa: E402
from processing.core.Processing import Processing  # noqa: E402
Processing.initialize()

project = QgsProject.instance()


def log(*a):
    print("[job]", *a, flush=True)


def add_vector(path, name=None, provider="ogr"):
    """Shapefile / GeoPackage layer ('file.gpkg|layername=x') / any OGR source."""
    lyr = QgsVectorLayer(path, name or os.path.splitext(os.path.basename(path))[0], provider)
    if not lyr.isValid():
        raise RuntimeError(f"invalid vector layer: {path}")
    project.addMapLayer(lyr)
    log("vector", lyr.name(), lyr.featureCount(), "features", lyr.crs().authid())
    return lyr


def add_csv_points(path, x="longitude", y="latitude", crs="EPSG:4326", name=None):
    """CSV with coordinates as points (tools/qgis/add-delimited-text-layer-csv.md)."""
    uri = (f"file://{os.path.abspath(path)}?delimiter=,&xField={x}&yField={y}&crs={crs}"
           "&detectTypes=yes&geomType=point")
    lyr = QgsVectorLayer(uri, name or os.path.splitext(os.path.basename(path))[0], "delimitedtext")
    if not lyr.isValid():
        raise RuntimeError(f"invalid CSV layer: {path}")
    project.addMapLayer(lyr)
    log("csv points", lyr.name(), lyr.featureCount())
    return lyr


def add_raster(path, name=None):
    lyr = QgsRasterLayer(path, name or os.path.splitext(os.path.basename(path))[0])
    if not lyr.isValid():
        raise RuntimeError(f"invalid raster: {path}")
    project.addMapLayer(lyr)
    return lyr


def run(alg, params, name=None, load=True):
    """Run a Processing algorithm; OUTPUT defaults to a temporary layer."""
    params = dict(params)
    params.setdefault("OUTPUT", "TEMPORARY_OUTPUT")
    res = processing.run(alg, params)
    out = res.get("OUTPUT")
    if load and isinstance(out, str):
        out = QgsVectorLayer(out, name or alg.split(":")[-1], "ogr")
    if load and out is not None and hasattr(out, "isValid"):
        if name:
            out.setName(name)
        project.addMapLayer(out)
        log(alg, "->", out.name(), getattr(out, "featureCount", lambda: "")())
    return out if load else res


def save_csv(layer, path):
    """Attribute table to CSV for the next tool (tools/qgis/export-layer-to-csv-or-shapefile.md)."""
    opts = QgsVectorFileWriter.SaveVectorOptions()
    opts.driverName = "CSV"
    opts.fileEncoding = "UTF-8"
    QgsVectorFileWriter.writeAsVectorFormatV3(layer, path, QgsCoordinateTransformContext(), opts)
    log("csv ->", path)


def save_gpkg(layer, path, layer_name):
    opts = QgsVectorFileWriter.SaveVectorOptions()
    opts.driverName = "GPKG"
    opts.layerName = layer_name
    opts.actionOnExistingFile = (QgsVectorFileWriter.CreateOrOverwriteLayer if os.path.exists(path)
                                 else QgsVectorFileWriter.CreateOrOverwriteFile)
    QgsVectorFileWriter.writeAsVectorFormatV3(layer, path, QgsCoordinateTransformContext(), opts)
    log("gpkg ->", path, layer_name)


def export_layout(png_path, title, layers, extent=None, crs=None, legend=True, scalebar=True, north_arrow=True,
                  dpi=300, layout_name="final"):
    """A4-landscape print layout with map, title, legend, scale bar, north arrow
    (tools/qgis/print-layout-map-export.md). Adjust positions to match the target."""
    if crs:
        project.setCrs(QgsCoordinateReferenceSystem(crs))
    mgr = project.layoutManager()
    old = mgr.layoutByName(layout_name)
    if old:
        mgr.removeLayout(old)
    layout = QgsPrintLayout(project)
    layout.initializeDefaults()
    layout.setName(layout_name)
    mgr.addLayout(layout)

    m = QgsLayoutItemMap(layout)
    m.attemptMove(QgsLayoutPoint(10, 20, QgsUnitTypes.LayoutMillimeters))
    m.attemptResize(QgsLayoutSize(275, 180, QgsUnitTypes.LayoutMillimeters))
    m.setLayers(layers)
    if extent is None:
        extent = QgsRectangle()
        for lyr in layers:
            extent.combineExtentWith(lyr.extent())
    m.setExtent(extent)
    m.setFrameEnabled(True)
    layout.addLayoutItem(m)

    t = QgsLayoutItemLabel(layout)
    t.setText(title)
    f = t.font(); f.setPointSize(20); t.setFont(f)
    t.adjustSizeToText()
    t.attemptMove(QgsLayoutPoint(10, 5, QgsUnitTypes.LayoutMillimeters))
    layout.addLayoutItem(t)

    if legend:
        lg = QgsLayoutItemLegend(layout)
        lg.setLinkedMap(m)
        lg.setAutoUpdateModel(True)
        lg.attemptMove(QgsLayoutPoint(230, 25, QgsUnitTypes.LayoutMillimeters))
        lg.setFrameEnabled(True)
        layout.addLayoutItem(lg)
    if scalebar:
        sb = QgsLayoutItemScaleBar(layout)
        sb.setStyle("Single Box")
        sb.setLinkedMap(m)
        sb.applyDefaultSize()
        sb.attemptMove(QgsLayoutPoint(200, 185, QgsUnitTypes.LayoutMillimeters))
        layout.addLayoutItem(sb)
    if north_arrow:
        na = QgsLayoutItemPicture(layout)
        na.setPicturePath(os.path.join(QgsApplication.svgPaths()[0], "arrows", "NorthArrow_02.svg"))
        na.attemptResize(QgsLayoutSize(15, 15, QgsUnitTypes.LayoutMillimeters))
        na.attemptMove(QgsLayoutPoint(15, 25, QgsUnitTypes.LayoutMillimeters))
        layout.addLayoutItem(na)

    settings = QgsLayoutExporter.ImageExportSettings()
    settings.dpi = dpi
    res = QgsLayoutExporter(layout).exportToImage(png_path, settings)
    log("layout ->", png_path, "ok" if res == QgsLayoutExporter.Success else f"error {res}")
    return layout


def finish(project_path=None):
    if project_path:
        project.write(project_path)
        log("project ->", project_path)
    if _own_app:
        QgsApplication.exitQgis()
    elif os.environ.get("AGENT_QUIT_WHEN_DONE"):
        from qgis.utils import iface
        iface.actionExit().trigger()


# ================================================================ STEPS (edit below)
# Example: count points in polygons, export for R, and make a map.
# polys = add_vector("inputs/boundaries.shp")
# pts = add_csv_points("work/cleaned.csv", x="longitude", y="latitude")
# counted = run("native:countpointsinpolygon",
#               {"POLYGONS": polys, "POINTS": pts, "FIELD": "NUMPOINTS"}, name="counts")
# save_csv(counted, "work/counts.csv")
# export_layout("final/map.png", "Facilities per region", [counted])
# finish("final/map.qgz")
finish()
