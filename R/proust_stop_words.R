#' Stop Words
#'
#' Stop words concatenated from various web sources.
#' 
#' @return a tibble with stopwords
#' @source \url{https://raw.githubusercontent.com/stopwords-iso/stopwords-fr/master/stopwords-fr.txt}
#' @source \url{http://www.ranks.nl/stopwords/french}
#' @source \url{http://www.naunaute.com/liste-stop-words-francais-393}
#' @source \url{https://sites.google.com/site/kevinbouge/stopwords-lists/stopwords_fr.txt?attredirects=0&d=1}
#' 
#' @export
#'
#' @examples
#' proust_stopwords()

proust_stopwords <- function() {
  return(structure(proustr::stop_words, class = c("tbl_df", "tbl", "data.frame")))
}

