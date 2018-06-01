# init regex 

pronom_regex_pps <- "\\b[Jj]e\\b|\\b[Mm]oi\\b|\\b[Mm]es*\\b|\\b[Mm][oa]n*\\b|\\b[Mm]ien(ne)*s*\\b"
pronom_regex_dps <- "\\b[Tt]u\\b|\\b[Tt]oi\\b|\\b[Tt]es*\\b|\\b[Tt][oa]n*\\b|\\b[Tt]ien(ne)*s*\\b"
pronom_regex_tps <- "\\b[Ii]l\\b|\\b[Ee]lle\\b|\\b[Ll]ui\\b|\\b[Ss]es*\\b|\\b[Ss][oa]n*\\b|\\b[Ss]oi\\b|\\b[Ss]ien(ne)*s*\\b"
pronom_regex_ppp <- paste0("\\b[Nn]ous\\b|\\b[Nn][o",intToUtf8(244),"]tre\\b|\\b[Nn]os*\\b")
pronom_regex_dpp <- paste0("\\b[Vv]ous\\b|\\b[Vv][o",intToUtf8(244),"]tre\\b|\\b[Vv]os*\\b")
pronom_regex_tpp <- "\\b[Ii]ls\\b|\\b[Ee]lles\\b|\\b[Ee]ux\\b|\\b[Ll]eurs*\\b"

#' Detect French pronoums
#'
#' Detect the pronouns from a text (in French)
#' 
#' @param df a dataframe
#' @param col the column containing the text
#' @param verbose wether or not to return the list of pronouns. Defaults is FALSE
#' 
#' @details The shortcuts in the pronoun col stand for: 
#' 
#' pps: first person singular (première personne du singulier)
#' 
#' dps: second person singular (deuxième personne du singulier)
#' 
#' tps: third person singular (troisième personne du singulier)
#' 
#' ppp: first person plural (première personne du pluriel)
#' 
#' dpp: second person singular (deuxième personne du pluriel)
#' 
#' tpp: third person singular (troisième personne du pluriel)
#' 
#' @export
#' @importFrom rlang quo_name enquo
#' @importFrom stringr str_extract_all
#' @importFrom tidyr gather
#' @importFrom attempt stop_if_not
#' 
#' @return a tibble with the detected pronouns
#'
#' @examples
#' library(proustr)
#' a <- proust_books()[1,] 
#' pr_detect_pro(a, text, verbose = TRUE)
#' pr_detect_pro(a, text)

pr_detect_pro <- function(df, col, verbose = FALSE){
  stop_if_not(inherits(df, "data.frame"), msg = "df should be a data.frame")
  col <- quo_name(enquo(col))
  df$pps <- str_extract_all(df[[col]], pattern = pronom_regex_pps)
  df$dps <- str_extract_all(df[[col]], pattern = pronom_regex_dps)
  df$tps <- str_extract_all(df[[col]], pattern = pronom_regex_tps)
  df$ppp <- str_extract_all(df[[col]], pattern = pronom_regex_ppp)
  df$dpp <- str_extract_all(df[[col]], pattern = pronom_regex_dpp)
  df$tpp <- str_extract_all(df[[col]], pattern = pronom_regex_tpp)
  pos <- which(names(df) == "pps") 
  if(verbose){
    df <- gather(df, key = "pronoun", value = "full_list", pos:length(df))
    df <- df[df$full_list != "character(0)",]
    structure(df, class = c("tbl_df", "tbl", "data.frame"))
  } else {
    df[,pos:length(df)] <- as.data.frame(lapply(df[,pos:length(df)], length_list))
    df <- gather(df, key = "pronoun", value = "count", pos:length(df))
    df <- df[df$count != 0,]
    structure(df, class = c("tbl_df", "tbl", "data.frame"))
  }
}
