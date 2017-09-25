#' Tidy data frame of Marcel Proust's 7 novels from La Recherche
#' 
#' Returns a tidy tibble of Marcel Proust's 7 novels from À la recherche du temps
#' perdu. The tibble contains four columns: text, book, volume and year.
#' 
#' @return A tibble with four columns: \code{text}, \code{book}, \code{volume} and \code{year}.
#' 
#' @name proust_books
#' 
#' @examples 
#' 
#' #Create the tibble 
#' proust <- proust_books()
#'  
#'
#' @export
proust_books <- function(){
        books <- rbind(proustr::ducotedechezswann,
                       proustr::alombredesjeunesfillesenfleurs,
                       proustr::lecotedeguermantes,
                       proustr::sodomeetgomorrhe,
                       proustr::laprisonniere,
                       proustr::albertinedisparue,
                       proustr::letempretrouve)
       structure(books, class = c("tbl_df", "tbl", "data.frame"))
}
