#' Normalize punctuation
#'
#' Normalize a text with usual french punctuation
#'
#' @param df a dataframe
#' @param col the column containing the text
#'
#' @export
#' @importFrom rlang quo_name enquo
#' @importFrom purrr map_chr
#' 
#' @return a normalized text
#'
#' @examples
#' a <- proustr::albertinedisparue[1:20,]
#' pr_normalize_punc(a, text)

pr_normalize_punc <- function(df, col){
  col <- rlang::quo_name(rlang::enquo(col))
  df[[col]] <- purrr::map_chr(.x = df[[col]], .f = clean_punc)
  return(df)
}

#' @noRd
#' @export

clean_punc <- function(vec){
  vec %>%
    # Quotation mark 
    stringr::str_replace_all(pattern = '″|‶|« | »|“|”|`|´|„|“', replacement = '"') %>%
    # Apostrophe
    stringr::str_replace_all(pattern = "՚|︐|’", replacement ="'") %>%
    # dot dot dot 
    stringr::str_replace_all(pattern = "…", replacement = "\\.\\.\\.")
}
