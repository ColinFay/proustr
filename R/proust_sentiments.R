#' Old sentiment lexicon
#
#' This function has been deprecated, and will be in next proustr version.
#' See the {rfeel} package now: http://github.com/ColinFay/rfeel
#' 
#' @param type For backward compatibility
#' @export
#' @return a tibble

proust_sentiments <- function(type = c("polarity", "score")) {
  message("This function no longer lives in {proustr}.")
  message("See the {rfeel} package.")
  message("http://github.com/ColinFay/rfeel")
}