#' H3 is valid
#'
#' Whether a given string represents a valid H3 index
#'
#'
#'
#' @param h3Index H3Index H3 index to check
#' @return `Boolean` - Whether the index is valid
#' @export
h3_is_valid <- function(h3Index) {
  .h3js_env$v8_context$call('h3.h3IsValid', h3Index)
}
#' H3 is pentagon
#'
#' Whether the given H3 index is a pentagon
#'
#'
#'
#' @param h3Index H3Index H3 index to check
#' @return `Boolean` - isPentagon
#' @export
h3_is_pentagon <- function(h3Index) {
  .h3js_env$v8_context$call('h3.h3IsPentagon', h3Index)
}
#' H3 is res class iii
#'
#' Whether the given H3 index is in a Class III resolution (rotated versusthe icosahedron and subject to shape distortion adding extra points onicosahedron edges, making them not true hexagons).
#'
#'
#'
#' @param h3Index H3Index H3 index to check
#' @return `Boolean` - isResClassIII
#' @export
h3_is_res_class_iii <- function(h3Index) {
  .h3js_env$v8_context$call('h3.h3IsResClassIII', h3Index)
}
#' H3 get base cell
#'
#' Get the number of the base cell for a given H3 index
#'
#'
#'
#' @param h3Index H3Index H3 index to get the base cell for
#' @return `Number` - Index of the base cell (0-121)
#' @export
h3_get_base_cell <- function(h3Index) {
  .h3js_env$v8_context$call('h3.h3GetBaseCell', h3Index)
}
#' H3 get resolution
#'
#' Returns the resolution of an H3 index
#'
#'
#'
#' @param h3Index H3Index H3 index to get resolution
#' @return `Number` - The number (0-15) resolution, or -1 if invalid
#' @export
h3_get_resolution <- function(h3Index) {
  .h3js_env$v8_context$call('h3.h3GetResolution', h3Index)
}
#' Geo to h3
#'
#' Get the hexagon containing a lat,lon point
#'
#'
#'
#' @param lat Number Latitude of point
#' @param lng Number Longtitude of point
#' @param res Number Resolution of hexagons to return
#' @return `H3Index` - H3 index
#' @export
h3_geo_to_h3 <- function(lat, lng, res) {
  .h3js_env$v8_context$call('h3.geoToH3', lat, lng, res)
}
#' H3 to geo
#'
#' Get the lat,lon center of a given hexagon
#'
#'
#'
#' @param h3Index H3Index H3 index
#' @return `Array.<Number>` - Point as a `[lat, lng]` pair
#' @export
h3_to_geo <- function(h3Index) {
  .h3js_env$v8_context$call('h3.h3ToGeo', h3Index)
}
#' H3 to geo boundary
#'
#' Get the vertices of a given hexagon (or pentagon), as an array of `[lat, lng]`points. For pentagons and hexagons on the edge of an icosahedron face, thisfunction may return up to 10 vertices.
#'
#'
#'
#' @param h3Index H3Index H3 index
#' @param formatAsGeoJson Boolean Whether to provide GeoJSON output: `[lng, lat]`, closed loops
#' @return `Array.<Array>` - Array of `[lat, lng]` pairs
#' @export
h3_to_geo_boundary <- function(h3Index, formatAsGeoJson = FALSE) {
  .h3js_env$v8_context$call('h3.h3ToGeoBoundary', h3Index, formatAsGeoJson)
}
#' H3 to parent
#'
#' Get the parent of the given hexagon at a particular resolution
#'
#'
#'
#' @param h3Index H3Index H3 index to get parent for
#' @param res Number Resolution of hexagon to return
#' @return `H3Index` - H3 index of parent, or null for invalid input
#' @export
h3_to_parent <- function(h3Index, res) {
  .h3js_env$v8_context$call('h3.h3ToParent', h3Index, res)
}
#' H3 to children
#'
#' Get the children/descendents of the given hexagon at a particular resolution
#'
#'
#'
#' @param h3Index H3Index H3 index to get children for
#' @param res Number Resolution of hexagons to return
#' @return `Array.<H3Index>` - H3 indexes of children, or empty array for invalid input
#' @export
h3_to_children <- function(h3Index, res) {
  .h3js_env$v8_context$call('h3.h3ToChildren', h3Index, res)
}
#' K ring
#'
#' Get all hexagons in a k-ring around a given center. The order of the hexagons is undefined.
#'
#'
#'
#' @param h3Index H3Index H3 index of center hexagon
#' @param ringSize Number Radius of k-ring
#' @return `Array.<H3Index>` - H3 indexes for all hexagons in ring
#' @export
h3_k_ring <- function(h3Index, ringSize) {
  .h3js_env$v8_context$call('h3.kRing', h3Index, ringSize)
}
#' K ring distances
#'
#' Get all hexagons in a k-ring around a given center, in an array of arraysordered by distance from the origin. The order of the hexagons within each ring is undefined.
#'
#'
#'
#' @param h3Index H3Index H3 index of center hexagon
#' @param ringSize Number Radius of k-ring
#' @return `Array.<Array.<H3Index>>` - Array of arrays with H3 indexes for all hexagons each ring
#' @export
h3_k_ring_distances <- function(h3Index, ringSize) {
  .h3js_env$v8_context$call('h3.kRingDistances', h3Index, ringSize)
}
#' Hex ring
#'
#' Get all hexagons in a hollow hexagonal ring centered at origin with sides of a given length.Unlike kRing, this function will throw an error if there is a pentagon anywhere in the ring.
#'
#' Throws `Error` If the algorithm could not calculate the ring
#'
#' @param h3Index H3Index H3 index of center hexagon
#' @param ringSize Number Radius of ring
#' @return `Array.<H3Index>` - H3 indexes for all hexagons in ring
#' @export
h3_hex_ring <- function(h3Index, ringSize) {
  .h3js_env$v8_context$call('h3.hexRing', h3Index, ringSize)
}
#' Polyfill
#'
#' Get all hexagons with centers contained in a given polygon. The polygonis specified with GeoJson semantics as an array of loops. Each loop isan array of `[lat, lng]` pairs (or `[lng, lat]` if isGeoJson is specified).The first loop is the perimeter of the polygon, and subsequent loops areexpected to be holes.
#'
#'
#'
#' @param coordinates Array.<Array> Array of loops, or a single loop
#' @param res Number Resolution of hexagons to return
#' @param isGeoJson Boolean Whether to expect GeoJson-style `[lng, lat]`                                 pairs instead of `[lat, lng]`
#' @return `Array.<H3Index>` - H3 indexes for all hexagons in polygon
#' @export
h3_polyfill <- function(coordinates, res, isGeoJson = FALSE) {
  .h3js_env$v8_context$call('h3.polyfill', coordinates, res, isGeoJson)
}
#' H3 set to multi polygon
#'
#' Get the outlines of a set of H3 hexagons, returned in GeoJSON MultiPolygonformat (an array of polygons, each with an array of loops, each an array ofcoordinates). Coordinates are returned as `[lat, lng]` pairs unless GeoJSONis requested.
#'
#'
#'
#' @param h3Indexes Array.<H3Index> H3 indexes to get outlines for
#' @param formatAsGeoJson Boolean Whether to provide GeoJSON output:                                   `[lng, lat]`, closed loops
#' @return `Array.<Array>` - MultiPolygon-style output.
#' @export
h3_set_to_multi_polygon <- function(h3Indexes, formatAsGeoJson = FALSE) {
  .h3js_env$v8_context$call('h3.h3SetToMultiPolygon', h3Indexes, formatAsGeoJson)
}
#' Compact
#'
#' Compact a set of hexagons of the same resolution into a set of hexagons acrossmultiple levels that represents the same area.
#'
#' Throws `Error` If the input is invalid (e.g. duplicate hexagons)
#'
#' @param h3Set Array.<H3Index> H3 indexes to compact
#' @return `Array.<H3Index>` - Compacted H3 indexes
#' @export
h3_compact <- function(h3Set) {
  .h3js_env$v8_context$call('h3.compact', h3Set)
}
#' Uncompact
#'
#' Uncompact a compacted set of hexagons to hexagons of the same resolution
#'
#' Throws `Error` If the input is invalid (e.g. invalid resolution)
#'
#' @param compactedSet Array.<H3Index> H3 indexes to uncompact
#' @param res Number The resolution to uncompact to
#' @return `Array.<H3Index>` - The uncompacted H3 indexes
#' @export
h3_uncompact <- function(compactedSet, res) {
  .h3js_env$v8_context$call('h3.uncompact', compactedSet, res)
}
#' H3 indexes are neighbors
#'
#' Whether two H3 indexes are neighbors (share an edge)
#'
#'
#'
#' @param origin H3Index Origin hexagon index
#' @param destination H3Index Destination hexagon index
#' @return `Boolean` - Whether the hexagons share an edge
#' @export
h3_indexes_are_neighbors <- function(origin, destination) {
  .h3js_env$v8_context$call('h3.h3IndexesAreNeighbors', origin, destination)
}
#' Get h3 unidirectional edge
#'
#' Get an H3 index representing a unidirectional edge for a given origin and destination
#'
#'
#'
#' @param origin H3Index Origin hexagon index
#' @param destination H3Index Destination hexagon index
#' @return `H3Index` - H3 index of the edge, or null if no edge is shared
#' @export
h3_get_h3_unidirectional_edge <- function(origin, destination) {
  .h3js_env$v8_context$call('h3.getH3UnidirectionalEdge', origin, destination)
}
#' Get origin h3 index from unidirectional edge
#'
#' Get the origin hexagon from an H3 index representing a unidirectional edge
#'
#'
#'
#' @param edgeIndex H3Index H3 index of the edge
#' @return `H3Index` - H3 index of the edge origin
#' @export
h3_get_origin_h3_index_from_unidirectional_edge <- function(edgeIndex) {
  .h3js_env$v8_context$call('h3.getOriginH3IndexFromUnidirectionalEdge', edgeIndex)
}
#' Get destination h3 index from unidirectional edge
#'
#' Get the destination hexagon from an H3 index representing a unidirectional edge
#'
#'
#'
#' @param edgeIndex H3Index H3 index of the edge
#' @return `H3Index` - H3 index of the edge destination
#' @export
h3_get_destination_h3_index_from_unidirectional_edge <- function(edgeIndex) {
  .h3js_env$v8_context$call('h3.getDestinationH3IndexFromUnidirectionalEdge', edgeIndex)
}
#' H3 unidirectional edge is valid
#'
#' Whether the input is a valid unidirectional edge
#'
#'
#'
#' @param edgeIndex H3Index H3 index of the edge
#' @return `Boolean` - Whether the index is valid
#' @export
h3_unidirectional_edge_is_valid <- function(edgeIndex) {
  .h3js_env$v8_context$call('h3.h3UnidirectionalEdgeIsValid', edgeIndex)
}
#' Get h3 indexes from unidirectional edge
#'
#' Get the `[origin, destination]` pair represented by a unidirectional edge
#'
#'
#'
#' @param edgeIndex H3Index H3 index of the edge
#' @return `Array.<H3Index>` - `[origin, destination]` pair as H3 indexes
#' @export
h3_get_h3_indexes_from_unidirectional_edge <- function(edgeIndex) {
  .h3js_env$v8_context$call('h3.getH3IndexesFromUnidirectionalEdge', edgeIndex)
}
#' Get h3 unidirectional edges from hexagon
#'
#' Get all of the unidirectional edges with the given H3 index as the origin (i.e. an edge toevery neighbor)
#'
#'
#'
#' @param h3Index H3Index H3 index of the origin hexagon
#' @return `Array.<H3Index>` - List of unidirectional edges
#' @export
h3_get_h3_unidirectional_edges_from_hexagon <- function(h3Index) {
  .h3js_env$v8_context$call('h3.getH3UnidirectionalEdgesFromHexagon', h3Index)
}
#' Get h3 unidirectional edge boundary
#'
#' Get the vertices of a given edge as an array of `[lat, lng]` points. Note that for edges thatcross the edge of an icosahedron face, this may return 3 coordinates.
#'
#'
#'
#' @param edgeIndex H3Index H3 index of the edge
#' @param formatAsGeoJson Boolean Whether to provide GeoJSON output: `[lng, lat]`
#' @return `Array.<Array>` - Array of geo coordinate pairs
#' @export
h3_get_h3_unidirectional_edge_boundary <- function(edgeIndex, formatAsGeoJson = FALSE) {
  .h3js_env$v8_context$call('h3.getH3UnidirectionalEdgeBoundary', edgeIndex, formatAsGeoJson)
}
#' H3 distance
#'
#' Get the grid distance between two hex indexes. This function may failto find the distance between two indexes if they are very far apart oron opposite sides of a pentagon.
#'
#'
#'
#' @param origin H3Index Origin hexagon index
#' @param destination H3Index Destination hexagon index
#' @return `Number` - Distance between hexagons, or a negative                              number if the distance could not be computed
#' @export
h3_distance <- function(origin, destination) {
  .h3js_env$v8_context$call('h3.h3Distance', origin, destination)
}
#' Hex area
#'
#' Average hexagon area at a given resolution
#'
#' Throws `Error` If the unit is invalid
#'
#' @param res Number Hexagon resolution
#' @param unit String Area unit (either UNITS.m2 or UNITS.km2)
#' @return `Number` - Average area
#' @export
h3_hex_area <- function(res, unit) {
  .h3js_env$v8_context$call('h3.hexArea', res, unit)
}
#' Edge length
#'
#' Average hexagon edge length at a given resolution
#'
#' Throws `Error` If the unit is invalid
#'
#' @param res Number Hexagon resolution
#' @param unit String Area unit (either UNITS.m or UNITS.km)
#' @return `Number` - Average edge length
#' @export
h3_edge_length <- function(res, unit) {
  .h3js_env$v8_context$call('h3.edgeLength', res, unit)
}
#' Num hexagons
#'
#' The total count of hexagons in the world at a given resolution. Note that aboveresolution 8 the exact count cannot be represented in a JavaScript 32-bit number,so consumers should use caution when applying further operations to the output.
#'
#'
#'
#' @param res Number Hexagon resolution
#' @return `Number` - Count
#' @export
h3_num_hexagons <- function(res) {
  .h3js_env$v8_context$call('h3.numHexagons', res)
}
#' Degs to rads
#'
#' Convert degrees to radians
#'
#'
#'
#' @param deg Number Value in degrees
#' @return `Number` - Value in radians
#' @export
h3_degs_to_rads <- function(deg) {
  .h3js_env$v8_context$call('h3.degsToRads', deg)
}
#' Rads to degs
#'
#' Convert radians to degrees
#'
#'
#'
#' @param rad Number Value in radians
#' @return `Number` - Value in degrees
#' @export
h3_rads_to_degs <- function(rad) {
  .h3js_env$v8_context$call('h3.radsToDegs', rad)
}
