#' Characters from Proust Books
#' 
#' Returns a tidy data frame of Marcel Proust's characters, with their frequency in each book. 
#' 
#' @return A tibble 
#' 
#' @name proust_characters
#' 
#' @examples 
#' 
#' #Creates the tibble 
#' proust <- proust_characters()
#'  
#'
#' @export
#' 
proust_characters <- function(){
  return(structure(proustr::proust_char, class = c("tbl_df", "tbl", "data.frame")))
}
