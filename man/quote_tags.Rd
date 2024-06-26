% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bioacousticsquote.R
\name{quote_tags}
\alias{quote_tags}
\title{List the tags of the quotes database}
\usage{
quote_tags(table = FALSE)
}
\arguments{
\item{table}{Logical. If \code{table=TRUE}, return a one-way frequency table
of quotes for each tag; otherwise return the sorted vector of unique tags.}
}
\value{
Returns either a vector of tags in the quotes database or a one-way
frequency table of the number of quotes for each tag.
}
\description{
This function finds the unique tags of items in the  quotes database and returns them
as vector or a one-way  table giving their frequencies.
}
\examples{
quote_tags()
quote_tags(table=TRUE)

library(ggplot2)
qt <- quote_tags(table=TRUE)
qtdf <-as.data.frame(qt)
# bar plot of frequencies
ggplot2::ggplot(data=qtdf, aes(x=Freq, y=tags)) +
    geom_bar(stat = "identity")

# Sort tags by frequency
qtdf |>
  dplyr::mutate(tags = forcats::fct_reorder(tags, Freq)) |>
  ggplot2::ggplot(aes(x=Freq, y=tags)) +
  geom_bar(stat = "identity")

}
