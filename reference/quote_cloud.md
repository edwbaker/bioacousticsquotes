# Generate a word cloud based upon quote database

This function takes a search pattern (or regular expression) and
generates a word cloud based upon that filter.

## Usage

``` r
quote_cloud(search = ".*", max.words = 80, colors, ...)
```

## Arguments

- search:

  Character string (or regular expression) used to search the database.
  Default is to search all quotes.

- max.words:

  Integer; The maximum number of words to be plotted.

- colors:

  A character vector of colors to be used to designate word frequency.
  The default is 5 levels, from light to dark green.

- ...:

  additional arguments passed to
  [`search_quotes`](http://quotes.acousti.cloud/reference/search_quotes.md)
  and `wordcloud`

## Value

None. A wordcloud is plotted.

## See also

[`bioacousticsquote`](http://quotes.acousti.cloud/reference/bioacousticsquote.md),
[`quote_tags`](http://quotes.acousti.cloud/reference/quote_tags.md),
[`quotes`](http://quotes.acousti.cloud/reference/quotes.md),
[`search_quotes`](http://quotes.acousti.cloud/reference/search_quotes.md).
`wordcloud`

## Examples

``` r
quote_cloud()

quote_cloud(search = "Hempton")

quote_cloud(max.words = 10)

```
