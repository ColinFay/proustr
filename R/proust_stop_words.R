#' Stop Words
#'
#' @return a tibble with stopwords
#' @export
#'
#' @examples
#' proust_stop_words()

proust_stopwords <- function() {
  df <- data.frame(word = proustr::stop_words)
  return(structure(df, class = c("tbl_df", "tbl", "data.frame")))
}