# init regex 

days_regex <- "\\b[Ll]undi\\b|\\b[Mm]ardi\\b|\\b[Mm]ercredi\\b|\\b[Jj]eudi\\b|\\b[Vv]endredi\\b|\\b[Ss]amedi\\b|\\b[Dd]imanche"

#' Detect french days
#'
#' Detect the name of the days (in French)
#'
#' @param df a dataframe
#' @param col the column containing the text
#' 
#' @export
#' @importFrom rlang quo_name enquo
#' @importFrom attempt stop_if_not
#' @importFrom stringr str_extract_all
#' 
#' @return a tibble with the number of days detected by the algo
#'
#' @examples
#' a <- data.frame(jours = c("C'est lundi 1er mars et mardi 2", 
#' "Et mercredi 3", "Il est revenu jeudi."))
#' pr_detect_days(a, jours)

pr_detect_days <- function(df, col){
  stop_if_not(inherits(df, "data.frame"), msg = "df should be a data.frame")
  col <- quo_name(enquo(col))
  df$days <- str_extract_all(df[[col]], pattern = days_regex)
  df$n_days <- length_list(df$days)
  structure(df, class = c("tbl_df", "tbl", "data.frame"))
}

month_regex <- paste0("\\b[Jj]anvier\\b|\\b[Ff][",intToUtf8(233),"e]vrier\\b|\\b[Mm]ars\\b|\\b[Aa]vril\\b|\\b[Mm]ai\\b|\\b[Jj]uin\\b|\\b[Jj]uillet\\b|\\b[Aa]o[u",intToUtf8(251),"]t\\b|\\b[Ss]eptembre\\b|\\b[Oo]ctobre\\b|\\b[Nn]ovembre\\b|\\b[Dd][",intToUtf8(233),"e]cembre\\b")     

#' Detect french months
#'
#' Detect the name of the months (in French)
#'
#' @param df a dataframe
#' @param col the column containing the text
#' @importFrom attempt stop_if_not
#' @export
#' 
#' @return a tibble with the number of days detected by the algo
#'
#' @examples
#' a <- data.frame(month = c("C'est lundi 1er mars et mardi 2", 
#' "Et mercredi 3", "Il est revenu en juin."))
#' pr_detect_months(a, month)

pr_detect_months <- function(df, col){
  stop_if_not(inherits(df, "data.frame"), msg = "df should be a data.frame")
  col <- quo_name(enquo(col))
  df$months <- str_extract_all(df[[col]], pattern = month_regex)
  df$n_months <- length_list(df$months)
  structure(df, class = c("tbl_df", "tbl", "data.frame"))
}
