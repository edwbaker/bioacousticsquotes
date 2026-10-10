# Display a randomly chosen statistical quote.

Display a randomly chosen statistical quote.

## Usage

``` r
bioacousticsquote(
  ind = NULL,
  pattern = NULL,
  tag = NULL,
  source = NULL,
  topic = NULL
)

# S3 method for class 'bioacousticsquote'
print(x, cite = TRUE, width = NULL, ...)

# S3 method for class 'bioacousticsquote'
as.data.frame(x, row.names = NULL, optional = FALSE, ...)
```

## Arguments

- ind:

  Integer or character. If 'ind' is missing, a random quote is chosen
  from all quotations. If 'ind' is specified and is an integer, return
  the ind^th quote. If 'ind' is specified and is character, use it as
  the 'pattern'.

- pattern:

  Character string. Quotes are subset to to those which match the
  pattern in the quote text.

- tag:

  Character string. Quotes are subset to those matching the specified
  tag.

- source:

  Character string. Quotes are subset to those matching the specified
  source (person).

- topic:

  Deprecated. Use 'tag' instead. Only kept for backward compatibility.

- x:

  object of class `'bioacousticsquote'`

- cite:

  logical; should the `cite` field be printed?

- width:

  Optional print width parameter

- ...:

  Other optional arguments, unused here

- row.names:

  see [`as.data.frame`](https://rdrr.io/r/base/as.data.frame.html)

- optional:

  see [`as.data.frame`](https://rdrr.io/r/base/as.data.frame.html)

## Value

A character vector containing one quote. It is of class
`bioacousticsquote` for which an S3 print method will be invoked, and
for which other methods are available.

## See also

[`quote_tags`](http://quotes.acousti.cloud/reference/quote_tags.md),
[`search_quotes`](http://quotes.acousti.cloud/reference/search_quotes.md),
[`quotes`](http://quotes.acousti.cloud/reference/quotes.md), Inspired
by: [`fortune`](https://rdrr.io/pkg/fortunes/man/fortunes.html)

[`as.latex`](http://quotes.acousti.cloud/reference/as.latex.md),
[`as.markdown`](http://quotes.acousti.cloud/reference/as.markdown.md)

## Examples

``` r
set.seed(1234)
bioacousticsquote()
#> 
#> The trees beside the hot burn snapped their fingers, and the lapping of
#> the burn itself added the final cadence to the symphony.
#> --- Ian Rankin, The Flood
bioacousticsquote(10)
#> 
#> A great silence is spreading over the natural world even as the sound
#> of man is becoming deafening.
#> --- Bernie Krause, The Great Animal Orchestra
bioacousticsquote("Seuketat")
#> 
#> Seuketat is the Eskimo word for ear-of-the-animal. This is what we must
#> become if we want to truly listen.
#> --- Gordon Hempton, Earth is a Solar Powered Jukebox
bioacousticsquote(pattern="Seuketat")
#> 
#> Seuketat is the Eskimo word for ear-of-the-animal. This is what we must
#> become if we want to truly listen.
#> --- Gordon Hempton, Earth is a Solar Powered Jukebox
bioacousticsquote(source="Hempton")
#> 
#> Seuketat is the Eskimo word for ear-of-the-animal. This is what we must
#> become if we want to truly listen.
#> --- Gordon Hempton, Earth is a Solar Powered Jukebox
bioacousticsquote(tag="poetry")
#> 
#> Elate on the fern branch the grasshopper sings, And away in the midst
#> of his roundelay springs.
#> --- Hogg, Address to a Wild Deer
print.data.frame(bioacousticsquote(9)) # All information
#>   qid
#> 9   9
#>                                                                                                         text
#> 9 Sound, because it is so intimate, immediate, and physical, is probably the most influential of our senses.
#>          source             cite  url      tags  tex
#> 9 Bernie Krause Wild Soundscapes <NA> listening <NA>
```
