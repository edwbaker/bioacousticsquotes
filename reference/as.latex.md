# Coerces bioacousticsquote objects to strings suitable for LaTeX

This function coerces bioacousticsquote objects to strings suitable for
rendering in LaTeX. Quotes and (potential LaTeX) sources are placed
within suitable "`epigraph`" output format via the
[`sprintf`](https://rdrr.io/r/base/sprintf.html) function.

## Usage

``` r
as.latex(quotes, form = "\\epigraph{%s}{%s}\n\n", cite = TRUE)
```

## Arguments

- quotes:

  an object of class `bioacousticsquote` returned from functions such as
  [`search_quotes`](http://quotes.acousti.cloud/reference/search_quotes.md)
  or
  [`bioacousticsquote`](http://quotes.acousti.cloud/reference/bioacousticsquote.md)

- form:

  structure of the LaTeX output for the text (first argument) and source
  (second argument) passed to
  [`sprintf`](https://rdrr.io/r/base/sprintf.html)

- cite:

  logical; should the `cite` field be included in the source output?

## Value

character vector of formatted LaTeX quotes

## See also

[`as.data.frame.bioacousticsquote`](http://quotes.acousti.cloud/reference/bioacousticsquote.md),
[`as.markdown`](http://quotes.acousti.cloud/reference/as.markdown.md)

## Author

Phil Chalmers

## Examples

``` r

ll <- search_quotes("Hempton")
as.latex(ll)
#> [1] "\\epigraph{Seuketat is the Eskimo word for ear-of-the-animal. This is what we must become if we want to truly listen.}{Gordon Hempton, Earth is a Solar Powered Jukebox}\n\n"                                                      
#> [2] "\\epigraph{How can we listen for something that we have not yet heard? We can't. When we listen in this way, selectively, we are actually practicing controlled impairment.}{Gordon Hempton, Earth is a Solar Powered Jukebox}\n\n"
```
