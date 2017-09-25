#' Create a Random Proust extract
#' 
#' Create your own flavor of Proust with this random extractor.
#'
#' @param count the number of line you want to randomly extract and paste. 
#' @param collapse if FALSE, the output will be a tibble. Default is TRUE, a character vector. 
#' 
#' @importFrom tidytext unnest_tokens
#' @importFrom dplyr select sample_n
#' @importFrom magrittr %>%
#' 
#' @return a character vector
#' @export
#'
#' @examples
#' proust_random(3)

proust_random <- function(count = 1, collapse = TRUE){
  assertthat::assert_that(inherits(count, "numeric"), msg = "count should be a number")
  assertthat::assert_that(inherits(collapse, "logical"), msg = "collapse should be a logical")
  temps <- proust_books() %>% 
    unnest_tokens(output = "sentence", input = "text", token = "sentences", to_lower = FALSE) %>% 
    select(sentence) %>% 
    sample_n(count) 
  if(collapse){
    return(paste(temps$sentence, sep = " ", collapse = " "))
  } else {
    return(temps)
  }
}
