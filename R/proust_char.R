#' Characters from Proust Books
#' 
#' Returns a tidy data frame of Marcel Proust's characters.
#' 
#' @return A tibble 
#' 
#' @source \url{http://proust-personnages.fr/}
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
  structure(proustr::proust_char, class = c("tbl_df", "tbl", "data.frame"))
}
