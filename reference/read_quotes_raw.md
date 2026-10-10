# Parse quotes from the file quotes_raw.txt.

There should be no reason for a person to call this function. This
function parses \`data-raw/quotes_raw.txt\`. The resulting dataframe is
then saved to \`data/quotes.rda\`. Although it would be possible to use
this function to parse the quotes when loading the package, that would
make it much slower to load the package.

## Usage

``` r
read_quotes_raw(file = file.path(getwd(), "data-raw/quotes_raw.txt"))
```

## Arguments

- file:

  The file of raw quotes.

## Value

Dataframe with quotes
