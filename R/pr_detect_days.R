#' Detect days
#'
#' Detect the name of the days
#'
#' @param df a dataframe
#' @param col the column containing the text
#' @noRd
#' @export
#' @importFrom rlang quo_name enquo
#' @importFrom purrr map_chr
#' 
#' @return a normalized text
#'
#' @examples
#' a <- data.frame(jours = c("C'était lun 1er mars et mar 2", "Et mercredi 3", "Il est revenu jeudi."))
#' pr_clean_days_(a, "jours")
#' (b <- pr_detect_days(a, jours))

pr_detect_days <- function(df, col){
  col <- rlang::quo_name(rlang::enquo(col))
  df <- pr_clean_days_(df = df, col = col)
  #df$days <- (string = df$jours[1], pattern = )
  df$days <- stringr::str_extract_all(df[[col]], pattern = days_regex)
  df$n_days <- lapply(df$days, length) %>% unlist
  return(structure(df, class = c("tbl_df", "tbl", "data.frame")))
}
(b <- pr_detect_days(a, jours))

#' Clean days
#'
#' Clean the name of the days
#'
#' @param df a dataframe
#' @param col the column containing the text
#' @noRd
#' @export
#' @importFrom rlang quo_name enquo
#' @importFrom purrr map_chr
#' 
#' @return a normalized text
#'
#' @examples
#' a <- data.frame(jours = c("Lun 1er mars", "Mar. 2 mars", "mer. 3 Mai"))
#' pr_clean_days(a, jours)

pr_clean_days <- function(df, col){
  col <- rlang::quo_name(rlang::enquo(col))
  df[col] <- lapply(df[col], clean_days)
  return(df)
}
pr_clean_days(a, jours)

#' a <- data.frame(jours = c("Lun 1er mars", "Mar. 2 mars", "mer. 3 Mai"))
#' pr_clean_days_(a, "jours")

pr_clean_days_ <- function(df, col){
  #col <- rlang::quo_name(rlang::enquo(col))
  df[[col]] <- purrr::map_chr(.x = df[[col]], .f = clean_days)
  return(df)
}
pr_clean_days_(a, "jours")

#' @noRd
#' @export

clean_days <- function(vec){
  vec %>%
    # Lundi 
    stringr::str_replace_all(pattern = "[Ll]un\\.* ", replacement = "lundi") %>%
    stringr::str_replace_all(pattern = "[Ll]un\\.*$", replacement = "lundi") %>%
    # Mardi
    stringr::str_replace_all(pattern = "[Mm]ar\\.* ", replacement = "mardi ") %>%
    stringr::str_replace_all(pattern = "[Mm]ar\\.*$", replacement = "mardi") %>%
    # Mercredi
    stringr::str_replace_all(pattern = "[Mm]er\\. ", replacement = "mercredi") %>%
    stringr::str_replace_all(pattern = "[Mm]er\\.\\.$", replacement = "mercredi.") %>%
    # Jeudi
    stringr::str_replace_all(pattern = "[Jj]eu\\.* ", replacement = "jeudi ") %>%
    stringr::str_replace_all(pattern = "[Jj]eu\\.$", replacement = "jeudi") %>%
    # Vendredi
    stringr::str_replace_all(pattern = "[Vv]en\\.* ", replacement = "vendredi ") %>%
    stringr::str_replace_all(pattern = "[Vv]en\\.*$", replacement = "vendredi") %>%
    #Samedi
    stringr::str_replace_all(pattern = "[Ss]am\\.* ", replacement = "samedi ") %>%
    stringr::str_replace_all(pattern = "[Ss]am\\.*$", replacement = "samedi") %>%
    #Dimanche
    stringr::str_replace_all(pattern = "[Dd]im\\.* ", replacement = "dimanche ") %>%
    stringr::str_replace_all(pattern = "[Dd]im\\.*$", replacement = "dimanche")
}

clean_days("Terre et mer.. Et jeu., ven. et sam")

#' @noRd
#' @export

days_regex <- "[Ll]undi|[Mm]ardi|[Mm]ercredi|[Jj]eudi|[Vv]endredi|[Ss]amedi|[Dd]imanche"
