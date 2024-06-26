
#' @importFrom utils data
.get.sq <- function(){
  #browser()
  .sq.env <- new.env()
  data(quotes, package = 'bioacousticsquotes', envir = .sq.env)
  .sq.env$quotes
}

#' Display a randomly chosen statistical quote.
#'
#' @param ind Integer or character.
#' If 'ind' is missing, a random quote is chosen from all quotations.
#' If 'ind' is specified and is an integer, return the ind^th quote.
#' If 'ind' is specified and is character, use it as the 'pattern'.
#'
#' @param pattern Character string. Quotes are subset to to those which
#' match the pattern in the quote text.
#'
#' @param tag Character string. Quotes are subset to those matching the
#' specified tag.
#'
#' @param source Character string. Quotes are subset to those matching
#' the specified source (person).
#'
#' @param topic Deprecated. Use 'tag' instead. Only kept for backward compatibility.

#' @return
#' A character vector containing one quote.
#' It is of class \code{bioacousticsquote} for which an S3 print method will be invoked, and for which
#' other methods are available.
#'
#' @export
#' @importFrom stringr str_detect
#' @seealso \code{\link{quote_tags}}, \code{\link{search_quotes}}, \code{\link{quotes}},
#' Inspired by: \code{\link[fortunes]{fortune}}
#' @examples
#' set.seed(1234)
#' bioacousticsquote()
#' bioacousticsquote(10)
#' bioacousticsquote("Seuketat")
#' bioacousticsquote(pattern="Seuketat")
#' bioacousticsquote(source="Hempton")
#' bioacousticsquote(tag="poetry")
#' print.data.frame(bioacousticsquote(9)) # All information
#'
bioacousticsquote <- function(ind=NULL, pattern=NULL, tag=NULL, source=NULL, topic=NULL) {

  dat <- .get.sq()

  if(!missing(topic)) {
    message("`topic` is deprecated. Please use `tag` instead of `topic`. Using your `topic` as a `tag`.")
    tag=topic
  }

  # Note: is.integer(23) is FALSE, is.integer(23L) is TRUE. Make our own fun.
  isInteger <-
    function(x) is.numeric(x) && all.equal(x, as.integer(x))

  # ind is a number
  if(!missing(ind) && isInteger(ind)) {
    if (min(ind)<1 | max(ind) > nrow(dat))
      stop("Numerical `ind` must be between 1 and ", nrow(dat))
    dat <- dat[ind,]
  }
  # ind is string, use it as 'pattern'
  if(!missing(ind) && is.character(ind)){
    OK <- which(str_detect(tolower(dat$text), tolower(ind)))
    dat <- dat[OK,]
	  }


  # Now 'ind' is missing
  if(missing(ind) && !is.null(tag)) {
    OK <- which(str_detect(tolower(dat$tags), tolower(tag)))
    dat <- dat[OK,]
	}

  if(missing(ind) && !is.null(source) ) {
    OK <- which(str_detect(tolower(dat$source), tolower(source)))
    dat <- dat[OK,]
	}

  if(missing(ind) && !is.null(pattern) ) {
    OK <- which(str_detect(tolower(dat$text), tolower(pattern)))
    dat <- dat[OK,]
  }

  if(nrow(dat)<1) stop("No matches found")

  # Finally, pick one at random
  ind <- sample(1:nrow(dat),1)

  res <- dat[ind,]
  class(res) <- c("bioacousticsquote", 'data.frame')
  return(res)
}

#' @rdname bioacousticsquote
#' @param x     object of class \code{'bioacousticsquote'}
#' @param cite  logical; should the \code{cite} field be printed?
#' @param width Optional print width parameter
#' @param ...   Other optional arguments, unused here
#' @export
#'
print.bioacousticsquote <- function(x, cite = TRUE, width = NULL, ...) {
    if (is.null(width)) width <- 0.9 * getOption("width")
    if (width < 10) stop("'width' must be greater than 10", call.=FALSE)
    x <- x[ ,c('text', 'source', 'cite')]
    if (nrow(x) > 1){
      for(i in 1L:nrow(x)){
        print(x[i,], cite=cite, width=width, ...)
      }
    } else {
      x$source <- paste("---", x$source)
      if(isTRUE(cite) && !is.na(x$cite)) {
        x$source <- paste0(x$source, ", ", x$cite)
      }
      out <- c(paste0("\n", strwrap(x$text, width)),
               paste0("\n", strwrap(x$source, width)))
      sapply(out, cat)
      cat("\n")
    }
    invisible()
}

#' @rdname bioacousticsquote
#' @param row.names see \code{\link{as.data.frame}}
#' @param optional see \code{\link{as.data.frame}}
#' @seealso \code{\link{as.latex}}, \code{\link{as.markdown}}
#' @export
#'
as.data.frame.bioacousticsquote <- function(x, row.names = NULL,
                                    optional = FALSE, ...) {
  class(x) <- 'data.frame'
  x
}

#' List the tags of the quotes database
#'
#' This function finds the unique tags of items in the  quotes database and returns them
#' as vector or a one-way  table giving their frequencies.
#'
#' @param table Logical. If \code{table=TRUE}, return a one-way frequency table
#' of quotes for each tag; otherwise return the sorted vector of unique tags.
#'
#' @return Returns either a vector of tags in the quotes database or a one-way
#' frequency table of the number of quotes for each tag.
#'
#' @export
#'
#' @examples
#' quote_tags()
#' quote_tags(table=TRUE)
#'
#' library(ggplot2)
#' qt <- quote_tags(table=TRUE)
#' qtdf <-as.data.frame(qt)
#' # bar plot of frequencies
#' ggplot2::ggplot(data=qtdf, aes(x=Freq, y=tags)) +
#'     geom_bar(stat = "identity")
#'
#' # Sort tags by frequency
#' qtdf |>
#'   dplyr::mutate(tags = forcats::fct_reorder(tags, Freq)) |>
#'   ggplot2::ggplot(aes(x=Freq, y=tags)) +
#'   geom_bar(stat = "identity")
#'
quote_tags <- function (table = FALSE) {
  data <- .get.sq()
  tags <- data[, "tags"]
  tags <- unlist(strsplit(tags, ","))
  tags <- trimws(tags)
  tags <- tags[!is.na(tags)]
  if (table) {
    table(tags)
  }
  else {
    tags <- unique(tags)
    sort(tags)
  }
}

#' Coerces bioacousticsquote objects to strings suitable for LaTeX
#'
#' This function coerces bioacousticsquote objects to strings suitable for rendering in LaTeX.
#' Quotes and (potential LaTeX) sources are placed within suitable "\code{epigraph}" output
#' format via the \code{\link{sprintf}} function.
#'
#' @param quotes an object of class \code{bioacousticsquote} returned from functions such as
#'   \code{\link{search_quotes}} or \code{\link{bioacousticsquote}}
#'
#' @param form structure of the LaTeX output for the text (first argument)
#'   and source (second argument) passed to \code{\link{sprintf}}
#'
#' @param cite logical; should the \code{cite} field be included in the source output?
#'
#' @return character vector of formatted LaTeX quotes
#'
#' @export
#' @author Phil Chalmers
#' @seealso \code{\link{as.data.frame.bioacousticsquote}}, \code{\link{as.markdown}}
#' @examples
#'
#' ll <- search_quotes("Hempton")
#' as.latex(ll)
#'

as.latex <- function(quotes, form = "\\epigraph{%s}{%s}\n\n", cite = TRUE){

  stopifnot('bioacousticsquote' %in% class(quotes))
  #replace the common csv symbols with LaTeX versions
  symbols2tex <- function(strings){
    strings <- as.character(strings)
    loc <- stringr::str_locate_all(strings, '\\*.?')
    pick <- which(sapply(loc, length) > 0)
    for(i in pick){
      index <- seq(1, nrow(loc[[i]]), by=2)
      for(j in length(index):1L)
        stringr::str_sub(strings[i], loc[[i]][index[j], 1L], loc[[i]][index[j], 1L]) <- '\\emph{'
    }
    strings <- stringr::str_replace_all(strings, '\\*', '}')
    strings <- stringr::str_replace_all(strings, ' \"', '``')
    strings
  }

  quotes$text <- symbols2tex(quotes$text)
  quotes$source <- if(cite) symbols2tex(paste0(quotes$source, ", ", quotes$cite))
    else symbols2tex(quotes$source)
  lines <- NULL
  if(is.null(quotes$TeXsource)) quotes$TeXsource <- ""
  for(i in 1:nrow(quotes)){
    lines <- c(lines, sprintf(form, quotes$text[i],
                              if(quotes$TeXsource[i] != "") quotes$TeXsource[i] else quotes$source[i]))
  }
  lines
}
