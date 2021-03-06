% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/h3api.R
\name{h3_k_ring_distances}
\alias{h3_k_ring_distances}
\title{K ring distances}
\usage{
h3_k_ring_distances(h3Index, ringSize)
}
\arguments{
\item{h3Index}{\code{H3Index} H3 index of center hexagon}

\item{ringSize}{\code{Number} Radius of k-ring}
}
\value{
\code{Array.<Array.<H3Index>>} - Array of arrays with H3 indexes for all hexagons each ring
}
\description{
Get all hexagons in a k-ring around a given center, in an array of arraysordered by distance from the origin. The order of the hexagons within each ring is undefined.
}
