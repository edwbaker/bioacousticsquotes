% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/search_quotes.R
\name{search_quotes}
\alias{search_quotes}
\alias{search_text}
\alias{get_quotes}
\title{Search the quote database for a string or regex pattern}
\usage{
search_quotes(
  search,
  ignore_case = TRUE,
  fuzzy = FALSE,
  fields = c("text", "source", "tags", "cite"),
  ...
)

search_text(search, fuzzy = FALSE, ...)

get_quotes(search = ".*", ...)
}
\arguments{
\item{search}{A character string or regex pattern to search the database.}

\item{ignore_case}{If \code{TRUE}, matching is done without regard to case.}

\item{fuzzy}{If \code{TRUE}, use \code{\link[base]{agrep}} to allow approximate matches to the search string.}

\item{fields}{A character vector of the particular fields to search.
The default is \code{c("text","source","tags")}.
You can use the shortcut \code{fields="all"} to search all fields (including citation, url).}

\item{...}{additional arguments passed to \code{\link[base]{agrep}} to fine-tune fuzzy search parameters.}
}
\value{
A data frame (also with class \code{'bioacousticsquote'}) object containing all quotes that match the search parameters.

A data frame (also with class \code{'bioacousticsquote'}) object
containing all quotes.
}
\description{
This function takes a search pattern (or regular expression) and returns all quotes
that match the pattern.

A convenient wrapper for search quotes that by default returns all quotes
}
\examples{
search_quotes("^D") # regex to find all quotes that start with "D"
search_quotes("Hempton") # all quotes with "Tukey"
search_quotes("Henpton", fuzzy = TRUE) # fuzzy match

# to a data.frame
out <- search_quotes("bad data", fuzzy = TRUE)
as.data.frame(out)

search_text("omnibus")
qdb <- get_quotes()
nrow(qdb)
names(qdb)

}
\seealso{
\code{\link[base]{agrep}}, \code{\link{bioacousticsquote}}.
}
