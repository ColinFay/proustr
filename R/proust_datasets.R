#' Characters from "À la recherche du temps perdu" 
#'
#' A dataset containing Marcel Proust's characters from "À la recherche du temps perdu"  and 
#' their frequency in each book. 
#' This text has been downloaded on proust-personnages.
#'
#' @source \url{http://proust-personnages.fr/?page_id=10254}
#' @noRd
#' @format A tibble with their name, and their frequency in each book
"proust_char"

#' Stop words
#'
#' Stop words from various web sources.
#'
#' @source \url{https://raw.githubusercontent.com/stopwords-iso/stopwords-fr/master/stopwords-fr.txt}
#' @source \url{http://www.ranks.nl/stopwords/french}
#' @source \url{http://www.naunaute.com/liste-stop-words-francais-393}
#' @source \url{https://sites.google.com/site/kevinbouge/stopwords-lists/stopwords_fr.txt?attredirects=0&d=1}
#' @noRd
#' @format A tibble
"stop_words"

#' Sentiment lexicon
#'
#' Amine Abdaoui, Jérôme Azé, Sandra Bringay et Pascal Poncelet. FEEL: French Expanded Emotion Lexicon. Language Resources and Evaluation, LRE 2016, pp 1-23.
#'
#' @source \url{http://www.lirmm.fr/~abdaoui/FEEL.html}
#' @noRd
#' @format A tibble
"sentiments_polarity"

#' Sentiment lexicon
#'
#' Amine Abdaoui, Jérôme Azé, Sandra Bringay et Pascal Poncelet. FEEL: French Expanded Emotion Lexicon. Language Resources and Evaluation, LRE 2016, pp 1-23.
#'
#' @source \url{http://www.lirmm.fr/~abdaoui/FEEL.html}
#' @noRd
#' @format A tibble
"sentiments_score"
