#' Normalize punctuation
#'
#' Normalize a text written with usual french punctuation
#'
#' @param df a dataframe
#' @param col the column to normalize
#'
#' @export
#' @importFrom rlang quo_name enquo
#' @importFrom purrr map_chr
#' @importFrom assertthat assert_that 
#' 
#' @return a tibble with normalized text
#'
#' @examples
#' a <- proustr::albertinedisparue[1:20,]
#' pr_normalize_punc(albertinedisparue, text)

pr_normalize_punc <- function(df, col){
  assertthat::assert_that(inherits(df, "data.frame"), msg = "df should be a data.frame")
  col <- rlang::quo_name(rlang::enquo(col))
  df[[col]] <- purrr::map_chr(.x = df[[col]], .f = clean_punc)
  structure(df, class = c("tbl_df", "tbl", "data.frame"))
}

pattern_quote <- paste0(intToUtf8(8243),"|",intToUtf8(8246),"|",intToUtf8(171)," | ",intToUtf8(187),"|",
                        intToUtf8(8220),"|",intToUtf8(8221),"|",intToUtf8(96),"|",intToUtf8(180),"|",
                        intToUtf8(8222),"|",intToUtf8(8220))

pattern_apo <- paste0(intToUtf8(1370),"|",intToUtf8(65040),"|",intToUtf8(8217))
  
clean_punc <- function(vec){
  vec %>%
    # Quotation mark 
    stringr::str_replace_all(pattern = pattern_quote, 
                             replacement = '"') %>%
    # Apostrophe
    stringr::str_replace_all(pattern = pattern_apo, 
                             replacement ="'") %>%
    # dot dot dot 
    stringr::str_replace_all(pattern = intToUtf8(8230), replacement = "\\.\\.\\.")
}