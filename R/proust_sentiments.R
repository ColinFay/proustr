#' Sentiment Lexicon
#' 
#' A sentiment lexicon with eitheir polarity or score.
#'
#' @param type polarity (positive or negative) or score on six sentiments (joy, fear, sadness, anger, surprise, disgust)
#' 
#' @source Amine Abdaoui, Jérôme Azé, Sandra Bringay et Pascal Poncelet. FEEL: French Expanded Emotion Lexicon. Language Resources and Evaluation, LRE 2016, pp 1-23.
#'
#' @return a tibble
#' @export
#'
#' @examples
#' proust_sentiments(type = "score")
#' proust_sentiments(type = "polarity")

proust_sentiments <- function(type = c("polarity", "score")) {
  type <- match.arg(type)
  if (type == "polarity"){
    structure(proustr::sentiments_polarity, class = c("tbl_df", "tbl", "data.frame"))
  } else {
    structure(proustr::sentiments_score, class = c("tbl_df", "tbl", "data.frame"))
  }
}