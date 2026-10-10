# Function to transform bioacousticsquote objects to strings suitable for markdown

This function coerces bioacousticsquote objects to strings suitable for
rendering in markdown. Quotes and sources are placed within output
formatted via the [`sprintf`](https://rdrr.io/r/base/sprintf.html)
function.

This function formats a bioacousticsquote object to the tagged
`key:value` format used for maintaining the bioacousticsquotes database.
The key names are:


      quo: This is a quotation.
      src: Person or persons who said or wrote the quote.
      cit: Citation for the original quote.
      url: URL where the quote can be found (such as journal articles).
      tag: Comma-separated tags to categorize the quote.
      tex: TeX-formatted citation

## Usage

``` r
as.markdown(quotes, form = "> *%s* -- %s\n\n", cite = TRUE)

as.tagged(quotes, qid = TRUE)
```

## Arguments

- quotes:

  an object of class `bioacousticsquote` returned from functions such as
  [`search_quotes`](http://quotes.acousti.cloud/reference/search_quotes.md)
  or
  [`bioacousticsquote`](http://quotes.acousti.cloud/reference/bioacousticsquote.md)

- form:

  structure of the markdown output for the text (first argument) and
  source (second argument) passed to
  [`sprintf`](https://rdrr.io/r/base/sprintf.html)

- cite:

  logical; should the `cite` field be included in the source output?

- qid:

  logical. Should the quote id number \`qid\` be included in the output?

## Value

character vector of formatted markdown quotes

A character vector of lines

## See also

[`as.data.frame.bioacousticsquote`](http://quotes.acousti.cloud/reference/bioacousticsquote.md),
[`as.latex`](http://quotes.acousti.cloud/reference/as.latex.md)

[`as.data.frame.bioacousticsquote`](http://quotes.acousti.cloud/reference/bioacousticsquote.md),
[`as.latex`](http://quotes.acousti.cloud/reference/as.latex.md),
`as.markdown`

## Examples

``` r

ll <- search_quotes("Hempton")
as.markdown(ll)
#> [1] "> *Seuketat is the Eskimo word for ear-of-the-animal. This is what we must become if we want to truly listen.* -- Gordon Hempton, Earth is a Solar Powered Jukebox\n\n"                                                      
#> [2] "> *How can we listen for something that we have not yet heard? We can't. When we listen in this way, selectively, we are actually practicing controlled impairment.* -- Gordon Hempton, Earth is a Solar Powered Jukebox\n\n"

qitems <- search_quotes("Hempton")
cat(as.tagged(qitems[1:5,]))
#> qid:3
#>  quo:Seuketat is the Eskimo word for ear-of-the-animal. This is what we must become if we want to truly listen.
#>  src:Gordon Hempton
#>  cit:Earth is a Solar Powered Jukebox
#>  tag:listening
#>  
#>  qid:4
#>  quo:How can we listen for something that we have not yet heard? We can't. When we listen in this way, selectively, we are actually practicing controlled impairment.
#>  src:Gordon Hempton
#>  cit:Earth is a Solar Powered Jukebox
#>  tag:listening
#>  
#>  qid:NA
#>  quo:NA
#>  
#>  qid:NA
#>  quo:NA
#>  
#>  qid:NA
#>  quo:NA
#>  
```
