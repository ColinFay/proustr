#' Tidy data frame of Marcel Proust's 7 novels from La Recherche
#' 
#' Returns a tidy data frame of Marcel Proust's 7 novels from À la recherche du temps
#' perdu. The data frame contains one column with the text, one with the book, and one with the 
#' volume.
#' 
#' @return A tibble with three columns: \code{text}, \code{book}, and \code{volume}.
#' 
#' @name proust_books
#' 
#' @examples 
#' 
#' #Creates the tibble 
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
       return(structure(books, class = c("tbl_df", "tbl", "data.frame")))
}
