# init regex 

pronom_regex_pps <- "\\b[Jj]e\\b|\\b[Mm]oi\\b|\\b[Mm]es*\\b|\\b[Mm][oa]n*\\b|\\b[Mm]ien(ne)*s*\\b"
pronom_regex_dps <- "\\b[Tt]u\\b|\\b[Tt]oi\\b|\\b[Tt]es*\\b|\\b[Tt][oa]n*\\b|\\b[Tt]ien(ne)*s*\\b"
pronom_regex_tps <- "\\b[Ii]l\\b|\\b[Ee]lle\\b|\\b[Ll]ui\\b|\\b[Ss]es*\\b|\\b[Ss][oa]n*\\b|\\b[Ss]oi\\b|\\b[Ss]ien(ne)*s*\\b"
pronom_regex_ppp <- paste0("\\b[Nn]ous\\b|\\b[Nn][o",intToUtf8(244),"]tre\\b|\\b[Nn]os*\\b")
pronom_regex_dpp <- paste0("\\b[Vv]ous\\b|\\b[Vv][o",intToUtf8(244),"]tre\\b|\\b[Vv]os*\\b")
pronom_regex_tpp <- "\\b[Ii]ls\\b|\\b[Ee]lles\\b|\\b[Ee]ux\\b|\\b[Ll]eurs*\\b"

#' Detect pronoums
#'
#' Detect the pronouns from a text. 
#' 
#' @param df a dataframe
#' @param col the column containing the text
#' @param verbose wether or not to return the list of pronouns. Defaults is FALSE. 
#' 
#' @export
#' @importFrom rlang quo_name enquo
#' @importFrom magrittr %>% %<>%
#' @importFrom stringr str_extract_all
#' @importFrom tidyr gather
#' @importFrom dplyr filter
#' 
#' @return a dataframe
#'
#' @examples
#' library(proustr)
#' a <- proust_books()[1,] 
#' pr_detect_pro(a, text, verbose = TRUE)
#' pr_detect_pro(a, text)

pr_detect_pro <- function(df, col, verbose = FALSE){
  col <- rlang::quo_name(rlang::enquo(col))
  df$pps <- stringr::str_extract_all(df[[col]], pattern = pronom_regex_pps)
  df$dps <- stringr::str_extract_all(df[[col]], pattern = pronom_regex_dps)
  df$tps <- stringr::str_extract_all(df[[col]], pattern = pronom_regex_tps)
  df$ppp <- stringr::str_extract_all(df[[col]], pattern = pronom_regex_ppp)
  df$dpp <- stringr::str_extract_all(df[[col]], pattern = pronom_regex_dpp)
  df$tpp <- stringr::str_extract_all(df[[col]], pattern = pronom_regex_tpp)
  pos <- which(names(df) == "pps") 
  if(verbose){
    df <- tidyr::gather(df, key = "pronoun", value = "full_list", pos:length(df))
    df <- dplyr::filter(df, full_list != "character(0)")
    return(df)
  } else {
    df[,pos:length(df)] <- purrr::map_df(df[,pos:length(df)], length_list)
    df <- tidyr::gather(df, key = "pronoun", value = "vol", pos:length(df))
    df <- dplyr::filter(df, vol != 0)
    return(df)
  }
}
