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
                "Du cote de chez Swann - Premiere partie" = ducotedechezswann1,
                "Du cote de chez Swann - Deuxieme partie" = ducotedechezswann2,
                "A l'ombre des jeunes filles en fleurs - Premiere partie" = alombredesjeunesfillesenfleurs1,
                "A l'ombre des jeunes filles en fleurs - Deuxieme partie" = alombredesjeunesfillesenfleurs2,
                "A l'ombre des jeunes filles en fleurs - Troisieme partie " = alombredesjeunesfillesenfleurs3,
                "Le Cote de Guermantes - Premiere partie " = lecotedeguermantes1,
                "Le Cote de Guermantes - Deuxieme partie" = lecotedeguermantes2,
                "Le Cote de Guermantes - Troisieme partie" = lecotedeguermantes3,
                "Sodome et Gomorrhe - Premiere partie" = sodomeetgomorrhe1,
                "Sodome et Gomorrhe - Deuxieme partie" = sodomeetgomorrhe2,
                "La Prisonniere - Premiere partie" = laprisonniere1,
                "La Prisonniere - Deuxieme partie" = laprisonniere2,
                "Albertine disparue - Tome Unique" = albertinedisparue,
                "Le temps retrouve - Premiere partie" = letempretrouve1,
                "Le temps retrouve - Deuxieme partie" = letempretrouve2
        )
       proust <- data.frame(text = unlist(books, use.names = FALSE), stringsAsFactors = FALSE)
       proust$book <- factor(rep(names(books), sapply(books, length)))
       proust <- tidyr::separate(proust, book, into = c("book","volume"), sep = "-")
       return(structure(proust, class = c("tbl_df", "tbl", "data.frame")))
}
