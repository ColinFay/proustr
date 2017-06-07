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
        books <- list(
                "Du cote de chez Swann - Premiere partie" = proustr::ducotedechezswann1,
                "Du cote de chez Swann - Deuxieme partie" = proustr::ducotedechezswann2,
                "A l'ombre des jeunes filles en fleurs - Premiere partie" = proustr::alombredesjeunesfillesenfleurs1,
                "A l'ombre des jeunes filles en fleurs - Deuxieme partie" = proustr::alombredesjeunesfillesenfleurs2,
                "A l'ombre des jeunes filles en fleurs - Troisieme partie " = proustr::alombredesjeunesfillesenfleurs3,
                "Le Cote de Guermantes - Premiere partie " = proustr::lecotedeguermantes1,
                "Le Cote de Guermantes - Deuxieme partie" = proustr::lecotedeguermantes2,
                "Le Cote de Guermantes - Troisieme partie" = proustr::lecotedeguermantes3,
                "Sodome et Gomorrhe - Premiere partie" = proustr::sodomeetgomorrhe1,
                "Sodome et Gomorrhe - Deuxieme partie" = proustr::sodomeetgomorrhe2,
                "La Prisonniere - Premiere partie" = proustr::laprisonniere1,
                "La Prisonniere - Deuxieme partie" = proustr::laprisonniere2,
                "Albertine disparue - Tome Unique" = proustr::albertinedisparue,
                "Le temps retrouve - Premiere partie" = proustr::letempretrouve1,
                "Le temps retrouve - Deuxieme partie" = proustr::letempretrouve2
        )
       proust <- data.frame(text = unlist(books, use.names = FALSE), stringsAsFactors = FALSE)
       proust$book <- factor(rep(names(books), sapply(books, length)))
       proust <- tidyr::separate(proust, book, into = c("book","volume"), sep = "-")
       return(structure(proust, class = c("tbl_df", "tbl", "data.frame")))
}
