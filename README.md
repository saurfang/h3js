
<!-- README.md is generated from README.Rmd. Please edit that file -->

# h3js

[![Travis build
status](https://travis-ci.org/saurfang/h3js.svg?branch=master)](https://travis-ci.org/saurfang/h3js)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/h3js)](https://cran.r-project.org/package=h3js)

R bindings to [H3](https://github.com/uber/h3), a hexagon-based
geographic grid system via [h3-js](https://github.com/uber/h3-js).

**WARNING** Functions do not support vectorized operations currently.
The return value of vectorized input is unspecified.

## Installation

You can install the released version of h3js from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("h3js")
```

Development version can be installed with:

``` r
devtools::install_github("saurfang/h3js")
```

## Core functions

``` r
library(h3js)
library(sf)
library(tidyverse)

# Convert a lat/lng point to a hexagon index at resolution 7
h3_index <- h3_geo_to_h3(37.3615593, -122.0553238, 7)
h3_index
#> [1] "87283472bffffff"

# Get the center of the hexagon
hex_center_coordinates <- h3_to_geo(h3_index)
hex_center_coordinates
#> [1]   37.35172 -122.05033

# Get the vertices of the hexagon
hex_boundary <- h3_to_geo_boundary(h3_index)
hex_boundary
#>          [,1]      [,2]
#> [1,] 37.34110 -122.0416
#> [2,] 37.35290 -122.0340
#> [3,] 37.36352 -122.0428
#> [4,] 37.36234 -122.0591
#> [5,] 37.35054 -122.0666
#> [6,] 37.33992 -122.0579

hex_boundary %>%
  # close polygon
  rbind(.[1,]) %>%
  # swap columns
  .[, c(2, 1)] %>%
  # convert to simple feature collection
  list() %>%
  st_polygon() %>%
  st_sfc() %>%
  plot()
```

<img src="man/figures/README-core-1.png" width="100%" />

## Useful algorithms

``` r
# Get all neighbors within 1 step of the hexagon
h3_k_ring(h3_index, 1)
#> [1] "87283472bffffff" "87283472affffff" "87283470cffffff" "87283470dffffff"
#> [5] "872834776ffffff" "872834729ffffff" "872834728ffffff"

# Get the set of hexagons within a polygon
polygon <- list(
    c(37.813318999983238, -122.4089866999972145),
    c(37.7198061999978478, -122.3544736999993603),
    c(37.8151571999998453, -122.4798767000009008)
)
hexagons <- h3_polyfill(polygon, 7)
hexagons
#> [1] "872830828ffffff" "87283082effffff" "87283082affffff" "87283082bffffff"
#> [5] "872830876ffffff" "872830820ffffff" "872830870ffffff"

# Get the outline of a set of hexagons, as a GeoJSON-style MultiPolygon
coordinates <- h3_set_to_multi_polygon(hexagons, TRUE)

c(
  coordinates %>%
    map(~ matrix(.x, ncol = 2)) %>%
    map(list) %>%
    st_multipolygon() %>%
    st_sfc(),
  do.call(rbind, polygon) %>%
    # close polygon
    rbind(.[1,]) %>%
    # swap columns
    .[, c(2, 1)] %>%
    list %>%
    st_polygon() %>%
    st_sfc()
) %>%
  st_sf() %>%
  plot()
```

<img src="man/figures/README-algo-1.png" width="100%" />
