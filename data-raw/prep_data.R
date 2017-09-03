## This is the script used to read wikisource
## and add books to the package

library(tidyverse)
library(stringr)
library(rvest)
library(magrittr)
options(stringsAsFactors = FALSE)

# function
get_book_wikisource <- function(url){
  url <- read_html(url)
  df <- url %>% 
    html_nodes("p") %>% 
    html_text() %>% 
    as.data.frame() %>% 
    rename(text = ".") %>%
    filter(text != "")
  df$book <- url %>% 
    html_node("#firstHeading") %>% 
    html_text() %>% 
    str_replace("/.*", "") %>% 
    str_replace("\\(....\\)", "")
  df$volume <- url %>% 
    html_node(".selflink") %>% 
    html_text()
  df$year <- url %>%
    html_node(".headertemplate-title") %>% 
    html_text() %>% 
    str_replace("\n", " ") %>% 
    str_extract("\\(....\\)") %>%
    str_replace_all("\\(|\\)", "") %>% 
    as.numeric()
  return(as.tibble(df))
}


#Get, complete, bind data 

ducotedechezswann1 <- get_book_wikisource("https://fr.wikisource.org/wiki/Du_c%C3%B4t%C3%A9_de_chez_Swann/Partie_1")
ducotedechezswann2 <- get_book_wikisource("https://fr.wikisource.org/wiki/Du_c%C3%B4t%C3%A9_de_chez_Swann/Partie_2")
ducotedechezswann2$year <- 1913
ducotedechezswann3 <- get_book_wikisource("https://fr.wikisource.org/wiki/Du_c%C3%B4t%C3%A9_de_chez_Swann/Partie_3")
ducotedechezswann <- rbind(ducotedechezswann1, ducotedechezswann2, ducotedechezswann3)

alombredesjeunesfillesenfleurs1 <- get_book_wikisource("https://fr.wikisource.org/wiki/%C3%80_l%E2%80%99ombre_des_jeunes_filles_en_fleurs/Premi%C3%A8re_partie")
alombredesjeunesfillesenfleurs2 <- get_book_wikisource("https://fr.wikisource.org/wiki/%C3%80_l%E2%80%99ombre_des_jeunes_filles_en_fleurs/Deuxi%C3%A8me_partie")
alombredesjeunesfillesenfleurs3 <- get_book_wikisource("https://fr.wikisource.org/wiki/%C3%80_l%E2%80%99ombre_des_jeunes_filles_en_fleurs/Troisi%C3%A8me_partie")
alombredesjeunesfillesenfleurs <- rbind(alombredesjeunesfillesenfleurs1, alombredesjeunesfillesenfleurs2, alombredesjeunesfillesenfleurs3)

lecotedeguermantes1 <- get_book_wikisource("https://fr.wikisource.org/wiki/Le_C%C3%B4t%C3%A9_de_Guermantes/Premi%C3%A8re_partie")
lecotedeguermantes1$year <- 1921
lecotedeguermantes2 <- get_book_wikisource("https://fr.wikisource.org/wiki/Le_C%C3%B4t%C3%A9_de_Guermantes/Deuxi%C3%A8me_partie")
lecotedeguermantes2$year <- 1921
lecotedeguermantes3 <- get_book_wikisource("https://fr.wikisource.org/wiki/Le_C%C3%B4t%C3%A9_de_Guermantes/Troisi%C3%A8me_partie")
lecotedeguermantes3$year <- 1921
lecotedeguermantes <- rbind(lecotedeguermantes1, lecotedeguermantes2, lecotedeguermantes3)

sodomeetgomorrhe1 <- get_book_wikisource("https://fr.wikisource.org/wiki/Sodome_et_Gomorrhe/Partie_1")
sodomeetgomorrhe1$volume <- "Première Partie"
sodomeetgomorrhe1$year <- 1922
sodomeetgomorrhe2 <- rbind(get_book_wikisource("https://fr.wikisource.org/wiki/Sodome_et_Gomorrhe/Partie_2_-_chapitre_1"), 
                           get_book_wikisource("https://fr.wikisource.org/wiki/Sodome_et_Gomorrhe/Partie_2_-_chapitre_2"),
                           get_book_wikisource("https://fr.wikisource.org/wiki/Sodome_et_Gomorrhe/Partie_2_-_chapitre_3"), 
                           get_book_wikisource("https://fr.wikisource.org/wiki/Sodome_et_Gomorrhe/Partie_2_-_chapitre_4"))
sodomeetgomorrhe2$volume <- "Deuxième Partie"
sodomeetgomorrhe2$year <- 1922
sodomeetgomorrhe <- rbind(sodomeetgomorrhe1, sodomeetgomorrhe2)

laprisonniere <- rbind(get_book_wikisource("https://fr.wikisource.org/wiki/La_Prisonni%C3%A8re/Chapitre_1"), 
                       get_book_wikisource("https://fr.wikisource.org/wiki/La_Prisonni%C3%A8re/Chapitre_2"),
                       get_book_wikisource("https://fr.wikisource.org/wiki/La_Prisonni%C3%A8re/Chapitre_3"))
laprisonniere$year <- 1923
laprisonniere$volume <- "Tome Unique"

albertinedisparue <- rbind(get_book_wikisource("https://fr.wikisource.org/wiki/Albertine_disparue/Chapitre_I"), 
                           get_book_wikisource("https://fr.wikisource.org/wiki/Albertine_disparue/Chapitre_II"), 
                           get_book_wikisource("https://fr.wikisource.org/wiki/Albertine_disparue/Chapitre_III"),
                           get_book_wikisource("https://fr.wikisource.org/wiki/Albertine_disparue/Chapitre_IV"))
albertinedisparue$volume <- "Tome Unique"

letempretrouve <- rbind(get_book_wikisource("https://fr.wikisource.org/wiki/Le_Temps_retrouv%C3%A9/I"), 
                        get_book_wikisource("https://fr.wikisource.org/wiki/Le_Temps_retrouv%C3%A9/II"),
                        get_book_wikisource("https://fr.wikisource.org/wiki/Le_Temps_retrouv%C3%A9/III"))
letempretrouve$volume <- "Tome Unique"

# Get characters
proust_char <-  read_html("http://proust-personnages.fr/?page_id=10254") %>% 
  html_node("table") %>% 
  html_table(header = TRUE) %>%
  as.tibble()

# Make it tidy
proust_char <- proust_perso %>%
  select(-Total) %>% 
  rename(ducotedechezswann = Swann, 
         alombredesjeunesfillesenfleurs = JF, 
         lecotedeguermantes = Guer, 
         sodomeetgomorrhe = SG, 
         laprisonniere = Pris, 
         albertinedisparue = Fug, 
         letempretrouve = TR) %>% 
  gather(key = "book", value = "frequency", 2:8) %>%
  filter(!is.na(frequency)) %>% 
  filter(frequency != 0)

# Get stopwords 

stopwords <- readLines("https://raw.githubusercontent.com/stopwords-iso/stopwords-fr/master/stopwords-fr.txt") %>%
  as.tibble()

stopwords2 <- read_html("http://www.ranks.nl/stopwords/french") %>%
  html_nodes("table") %>%
  html_text() %>%
  stringr::str_split(pattern = " ") %>%
  as.data.frame()

stopwords4 <- read_html("http://www.naunaute.com/liste-stop-words-francais-393") %>%
  html_nodes("code") %>%
  html_text() %>%
  stringr::str_split(pattern = "\n") %>%
  as.data.frame()

stopwords5 <- readLines("https://sites.google.com/site/kevinbouge/stopwords-lists/stopwords_fr.txt?attredirects=0&d=1") %>%
  as.tibble()

stop_words <- c(stopwords$value, stopwords2$c..alors....au....aucuns....aussi....autre....avant....avec..., stopwords3$a, stopwords4$c..à....à.demi....à.peine....à.peu.près....absolument..., stopwords5$value) %>%
  unique()

# Sentiments 

sentiments <- read_csv2("http://www.lirmm.fr/~abdaoui/FEEL.csv")
sentiments_polarity <- sentiments %>%
  select(word, polarity)
sentiments_score <- sentiments %>% 
  select(word, joy:disgust) %>% 
  gather(key = sentiment, value = score, joy:disgust) %>%
  filter(score != 0) %>%
  arrange(word)

## Add data 

devtools::use_data(ducotedechezswann, overwrite = TRUE)
devtools::use_data(alombredesjeunesfillesenfleurs, overwrite = TRUE)
devtools::use_data(lecotedeguermantes, overwrite = TRUE)
devtools::use_data(sodomeetgomorrhe, overwrite = TRUE)
devtools::use_data(laprisonniere, overwrite = TRUE)
devtools::use_data(albertinedisparue, overwrite = TRUE)
devtools::use_data(letempretrouve, overwrite = TRUE)
devtools::use_data(proust_char, overwrite = TRUE)
devtools::use_data(stop_words, overwrite = TRUE)
devtools::use_data(sentiments_polarity, overwrite = TRUE)
devtools::use_data(sentiments_score, overwrite = TRUE)
