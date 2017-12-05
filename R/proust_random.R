#' Create a Random Proust extract
#' 
#' Create your own flavor of Proust with this random extractor.
#'
#' @param count the number of line you want to randomly extract and paste. 
#' @param collapse if FALSE, the output will be a tibble. Default is TRUE, a character vector. 
#' 
#' @importFrom asserthat assert_that
#' @importFrom purrr map
#' @importFrom tokenizers tokenize_sentences
#' 
#' @return a character vector
#' @export
#'
#' @examples
#' proust_random(4)

proust_random <- function(count = 1, collapse = TRUE){
  assert_that(inherits(count, "numeric"), msg = "count should be a number")
  assert_that(inherits(collapse, "logical"), msg = "collapse should be a logical")
  temp <- map(proust_books()$text, tokenize_sentences) %>%
    unlist() %>%
    sample(count)
  if(collapse){
    return(paste(temp, sep = " ", collapse = " "))
  } else {
    structure(data.frame(text = temp) , class = c("tbl_df", "tbl", "data.frame"))
  }
}
