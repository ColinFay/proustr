#' Create a Random Proust extract
#' 
#' Create your own flavor of Proust with this random extractor.
#'
#' @param count the number of line you want to randomly extract and paste. 
#' @param collapse if FALSE, the output will be a tibble. Default is TRUE, a character vector. 
#' 
#' @return a character vector
#' @export
#'
#' @examples
#' proust_random(4)

proust_random <- function(count = 1, collapse = TRUE){
  assertthat::assert_that(inherits(count, "numeric"), msg = "count should be a number")
  assertthat::assert_that(inherits(collapse, "logical"), msg = "collapse should be a logical")
  temp <- lapply(proust_books()$text, tokenizers::tokenize_sentences) %>%
    unlist() %>%
    sample(count)
  if(collapse){
    return(paste(temp, sep = " ", collapse = " "))
  } else {
    structure(data.frame(text = temp) , class = c("tbl_df", "tbl", "data.frame"))
  }
}
