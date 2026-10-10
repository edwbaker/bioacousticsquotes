# Search the quote database for a string or regex pattern

This function takes a search pattern (or regular expression) and returns
all quotes that match the pattern.

A convenient wrapper for search quotes that by default returns all
quotes

## Usage

``` r
search_quotes(
  search,
  ignore_case = TRUE,
  fuzzy = FALSE,
  fields = c("text", "source", "tags", "cite"),
  ...
)

search_text(search, fuzzy = FALSE, ...)

get_quotes(search = ".*", ...)
```

## Arguments

- search:

  A character string or regex pattern to search the database.

- ignore_case:

  If `TRUE`, matching is done without regard to case.

- fuzzy:

  If `TRUE`, use [`agrep`](https://rdrr.io/r/base/agrep.html) to allow
  approximate matches to the search string.

- fields:

  A character vector of the particular fields to search. The default is
  `c("text","source","tags")`. You can use the shortcut `fields="all"`
  to search all fields (including citation, url).

- ...:

  additional arguments passed to
  [`agrep`](https://rdrr.io/r/base/agrep.html) to fine-tune fuzzy search
  parameters.

## Value

A data frame (also with class `'bioacousticsquote'`) object containing
all quotes that match the search parameters.

A data frame (also with class `'bioacousticsquote'`) object containing
all quotes.

## See also

[`agrep`](https://rdrr.io/r/base/agrep.html),
[`bioacousticsquote`](http://quotes.acousti.cloud/reference/bioacousticsquote.md).

## Examples

``` r
search_quotes("^D") # regex to find all quotes that start with "D"
#> The search string '^d' did not match any items.
search_quotes("Hempton") # all quotes with "Tukey"
#> 
#> Seuketat is the Eskimo word for ear-of-the-animal. This is what we must
#> become if we want to truly listen.
#> --- Gordon Hempton, Earth is a Solar Powered Jukebox
#> 
#> How can we listen for something that we have not yet heard? We can't.
#> When we listen in this way, selectively, we are actually practicing
#> controlled impairment.
#> --- Gordon Hempton, Earth is a Solar Powered Jukebox
search_quotes("Henpton", fuzzy = TRUE) # fuzzy match
#> 
#> Seuketat is the Eskimo word for ear-of-the-animal. This is what we must
#> become if we want to truly listen.
#> --- Gordon Hempton, Earth is a Solar Powered Jukebox
#> 
#> How can we listen for something that we have not yet heard? We can't.
#> When we listen in this way, selectively, we are actually practicing
#> controlled impairment.
#> --- Gordon Hempton, Earth is a Solar Powered Jukebox

# to a data.frame
out <- search_quotes("bad data", fuzzy = TRUE)
#> The search string 'bad data' did not match any items.
as.data.frame(out)
#> data frame with 0 columns and 0 rows

search_text("omnibus")
#> The search string 'omnibus' did not match any items.
qdb <- get_quotes()
nrow(qdb)
#> [1] 28
names(qdb)
#> [1] "qid"    "text"   "source" "cite"   "url"    "tags"   "tex"   
```
