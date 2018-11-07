#' Stop Words
#'
#' Stop words concatenated from various web sources.
#' 
#' @return a tibble with stopwords
#' @source \url{https://raw.githubusercontent.com/stopwords-iso/stopwords-fr/master/stopwords-fr.txt}
#' 
#' @export
#'
#' @examples
#' proust_stopwords()

proust_stopwords <- function() {
  proustr::stop_words
}

