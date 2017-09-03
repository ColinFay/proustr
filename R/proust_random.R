#' Create a Random Proust extract
#' 
#' Create your own flavor of Proust
#'
#' @param vol the number of line you want to randomly extract and paste. 
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

proust_random <- function(vol = 1, collapse = TRUE){
  temps <- proust_books() %>% 
    unnest_tokens(output = "sentence", input = "text", token = "sentences", to_lower = FALSE) %>% 
    select(sentence) %>% 
    sample_n(vol) 
  if(collapse){
    return(paste(temps$sentence, sep = " ", collapse = " "))
  } else {
    return(temps)
  }
}
