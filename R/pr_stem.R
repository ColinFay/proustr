#' Stem a dataframe containing a column with sentences
#' 
#' Implementation of the {SnowballC} stemmer. Note that punctuation and capital letters 
#' are removed when processing.
#'
#' @param df the data.frame containing the text
#' @param col the column with the text
#' @param language the language of the text. Defaut is french. See SnowballC::getStemLanguages() function for a list of supported languages.
#'
#' @importFrom tokenizers tokenize_word_stems
#' @importFrom assertthat assert_that
#'
#' @return a tibble
#' 
#' @export
#'
#' @examples
#' a <- proustr::laprisonniere[1:10,]
#' pr_stem_sentences(a, text)
#' 
pr_stem_sentences <- function(df, col, language = "french"){
  assertthat::assert_that(inherits(df, "data.frame"), msg = "df should be a data.frame")
  col <- rlang::quo_name(rlang::enquo(col))
  df[[col]] <- purrr::map_chr(.x = df[[col]], .f = pr_stem_vec, language = language)
  structure(df, class = c("tbl_df", "tbl", "data.frame"))
}

pr_stem_vec <- function(vec, language = "french"){
  vec <- tokenizers::tokenize_word_stems(vec, language = language)
  paste0(unlist(vec), collapse = " ")
}

#' Stem a dataframe containing a column with words
#' 
#' Implementation of the {SnowballC} stemmer. Note that punctuation and capitals letters 
#' are also removed.
#'
#' @param df the data.frame containing the sentences
#' @param col the column with the sentences
#' @param language the language of the words Defaut is french. See SnowballC::getStemLanguages() function for a list of supported languages.
#'
#' @importFrom SnowballC wordStem
#'
#' @return a tibble
#' 
#' @export
#'
#' @examples
#' a <- data.frame(words = c("matin", "heure", "fatigué","sonné","lois", "tests","fusionner"))
#' pr_stem_words(a, words)
#' 
pr_stem_words <- function(df, col, language = "french"){
  assertthat::assert_that(inherits(df, "data.frame"), msg = "df should be a data.frame")
  col <- rlang::quo_name(rlang::enquo(col))
  df[[col]] <- purrr::map_chr(.x = df[[col]], .f = SnowballC::wordStem, language = language)
  structure(df, class = c("tbl_df", "tbl", "data.frame"))
}
