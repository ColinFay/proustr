# init regex 

pronom_regex_pps <- "\\b[Jj]e\\b|\\b[Mm]oi\\b|\\b[Mm]es*\\b|\\b[Mm][oa]n*\\b|\\b[Mm]ien(ne)*s*\\b"
pronom_regex_dps <- "\\b[Tt]u\\b|\\b[Tt]oi\\b|\\b[Tt]es*\\b|\\b[Tt][oa]n*\\b|\\b[Tt]ien(ne)*s*\\b"
pronom_regex_tps <- "\\b[Ii]l\\b|\\b[Ee]lle\\b|\\b[Ll]ui\\b|\\b[Ss]es*\\b|\\b[Ss][oa]n*\\b|\\b[Ss]oi\\b|\\b[Ss]ien(ne)*s*\\b"
pronom_regex_ppp <- "\\b[Nn]ous\\b|\\b[Nn][oô]tre\\b|\\b[Nn]os*\\b"
pronom_regex_dpp <- "\\b[Vv]ous\\b|\\b[Vv][oô]tre\\b|\\b[Vv]os*\\b"
pronom_regex_tpp <- "\\b[Ii]ls\\b|\\b[Ee]lles\\b|\\b[Ee]ux\\b|\\b[Ll]eurs*\\b"

#' Detect pronoums
#'
#' Detect the pronouns. The detected Pronouns are : je, moi, me, mon, ma, mes, mien,
#' miens,mienne,miennes, tu, toi, te, ton, ta, tes, tiens, tienne, tiennes, il, elle, son, sa, ses, soi, sien,
#' siens, siennes, nous, nôtre, nos, vous, vos, votre, vôtre, ils, elles, eux, leurs. 
#'
#' @param df a dataframe
#' @param col the column containing the text
#' @param verbose wether or not to return the list of pronouns. Defaults is FALSE. 
#' 
#' @export
#' @importFrom rlang quo_name enquo
#' @importFrom magrittr %>% %<>%
#' @importFrom stringr str_extract_all
#' 
#' @return a dataframe
#'
#' @examples
#' library(proustr)
#' a <- proust_books()[1,]
#' b <- pr_detect_pro(a, text)

pr_detect_pro <- function(df, col, verbose = FALSE){
  col <- rlang::quo_name(rlang::enquo(col))
  df$pps <- stringr::str_extract_all(df[[col]], pattern = pronom_regex_pps)
  df$dps <- stringr::str_extract_all(df[[col]], pattern = pronom_regex_dps)
  df$tps <- stringr::str_extract_all(df[[col]], pattern = pronom_regex_tps)
  df$ppp <- stringr::str_extract_all(df[[col]], pattern = pronom_regex_ppp)
  df$dpp <- stringr::str_extract_all(df[[col]], pattern = pronom_regex_dpp)
  df$tpp <- stringr::str_extract_all(df[[col]], pattern = pronom_regex_tpp)
  if(verbose){
    return(df)
  } else {
    pos <- which(names(df) == "pps") 
    df[,pos:length(df)] <- purrr::map_df(df[,pos:length(df)], length_list)
    return(df)
  }
}