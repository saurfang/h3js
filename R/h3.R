.h3js_env <- new.env()

.onLoad <- function(libname, pkgname) {
  assign("v8_context", V8::v8(), envir = .h3js_env)
  .h3js_env$v8_context$source(system.file("h3/bundle.js", package = "h3js", mustWork = TRUE))
}
