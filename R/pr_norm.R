#' Normalize punctuation
#'
#' Normalize a text written with usual french punctuation
#'
#' @param df a dataframe
#' @param col the column to normalize
#'
#' @export
#' @importFrom rlang quo_name enquo
#' @importFrom attempt stop_if_not
#' 
#' @return a tibble with normalized text
#'
#' @examples
#' a <- proustr::albertinedisparue[1:20,]
#' pr_normalize_punc(albertinedisparue, text)

pr_normalize_punc <- function(df, col){
  stop_if_not(inherits(df, "data.frame"), msg = "df should be a data.frame")
  col <- quo_name(enquo(col))
  df[[col]] <- as.character(lapply(df[[col]], clean_punc))
  structure(df, class = c("tbl_df", "tbl", "data.frame"))
}

pattern_quote <- paste0(intToUtf8(8243),"|",intToUtf8(8246),"|",intToUtf8(171)," | ",intToUtf8(187),"|",
                        intToUtf8(8220),"|",intToUtf8(8221),"|",intToUtf8(96),"|",intToUtf8(180),"|",
                        intToUtf8(8222),"|",intToUtf8(8220))

pattern_apo <- paste0(intToUtf8(1370),"|",intToUtf8(65040),"|",intToUtf8(8217))
  
#' @importFrom stringr str_replace_all

clean_punc <- function(vec){
  vec <- str_replace_all(vec, pattern = pattern_quote, 
                         replacement = '"')
  vec <- str_replace_all(vec, pattern = pattern_apo, 
                         replacement ="'")
  str_replace_all(vec, pattern = intToUtf8(8230), replacement = "\\.\\.\\.")
}

#' Remove accents
#'
#' Remove accents from a character vector
#'
#' @param text a vector
#'
#' @export
#' 
#' @return a vector 
#' 
#' @examples
#' pr_unacent("du chêne")
pr_unacent <- function(text) {
  text <- gsub("['`^~\"]", " ", text) 
  text <- iconv(text, to="ASCII//TRANSLIT//IGNORE")
  gsub("['`^~\"]", "", text)
}

#' Remove non alnum elements
#'
#' Remove non alnum elements
#'
#' @param text a vector
#' @param replacement what to replace the non alnum with. Defaut is " ". 
#'
#' @export
#' 
#' @return a vector 
#' 
#' @examples
#' pr_keep_only_alnum("neuilly-en-thelle")

pr_keep_only_alnum <- function(text, replacement = " "){
  res <- gsub("[^[:alnum:]]", replacement, text) 
  gsub(" {2,}", " ", res) 
}
