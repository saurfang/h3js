library(tidyverse)
library(glue)
library(snakecase)

#system("cd inst/h3; browserify index.js -o bundle.js")

h3doc <- system("jsdoc2md --json inst/h3/node_modules/h3-js/lib/h3core.js", intern = TRUE) %>%
  jsonlite::fromJSON()

glimpse(h3doc)

trim_br <- function(x) {
  gsub("[", "`[", fixed = TRUE,
       gsub("]", "]`", fixed = TRUE,
            gsub("[\r\n]", "", x)
            )
       )
}

h3doc %>%
  select(-meta) %>%
  filter(
    kind == 'function',
    scope == 'static',
    memberof == 'module:h3',
    is.na(access)
  ) %>%
  # head %>%
  pmap(function(name, description, params, returns, exceptions, ...) {
    params$type <- unlist(params$type$names)

    params_doc <- params %>%
      pmap_chr(function(type, description, name) {
        glue("#' @param {name} `{type}` {description}") %>% trim_br
      }) %>%
      paste(collapse = "\n")

    exceptions <- if (is.null(exceptions)) {
      "#'"
    } else {
      exceptions %>%
        pmap_chr(function(type, description) {
          glue("#' Throws `{type}` {description}") %>% trim_br
        }) %>%
        paste(collapse = "\n")
    }

    params_with_defaults <- params %>%
      pmap_chr(function(name, type, ...) {
        if (type == "Boolean") {
          glue("{name} = FALSE")
        } else {
          name
        }
      }) %>%
      paste(collapse = ", ")
    params <- paste(params$name, collapse = ", ")

    returns <- glue("`{returns$type$names}` - {returns$description}") %>% trim_br

    fun_name <- to_snake_case(name, numerals = "left")
    doc_name <- to_sentence_case(fun_name, numerals = "left")
    if (!startsWith(fun_name, "h3")) fun_name <- paste0("h3_", fun_name)

    glue(
      "
#' {doc_name}
#'
#' {trim_br(description)}
#'
{exceptions}
#'
{params_doc}
#' @return {returns}
#' @export
{fun_name} <- function({params_with_defaults}) {{
  .h3js_env$v8_context$call('h3.{name}', {params})
}}
      "
    )
  }) %>%
  write_lines("R/h3api.R")
