
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/proustr)](https://cran.r-project.org/package=proustr) [![Travis-CI Build Status](https://travis-ci.org/ColinFay/proustr.svg?branch=master)](https://travis-ci.org/ColinFay/proustr) [![Rdoc](http://www.rdocumentation.org/badges/version/proustr)](http://www.rdocumentation.org/packages/proustr) ![Metacran](http://www.r-pkg.org/badges/version-last-release/proustr) ![Metacran](https://cranlogs.r-pkg.org/badges/proustr)

`proustr` is now on [CRAN](https://CRAN.R-project.org/package=proustr).

\[Note: this package is a work in progress. Every undocumented function should be considered as still under development.\]

Tools for Natural Language Processing in French and texts from Marcel Proust's collection "A La Recherche Du Temps Perdu"
-------------------------------------------------------------------------------------------------------------------------

<p align="center">
<img src="https://github.com/ColinFay/proustr/blob/master/proustr_hex.png?raw=true" width = "250">
</p>
This package gives you access to tools designed to do Natural Language Processing in French. You can use these tools with the books from Marcel Proust "À la recherche du temps perdu", which are provided in this package. Of course, these tools can be expanded to almost all french texts.

All the functions from this package are consistent with the tidyverse philosophy.

Here is a list of all the books contained in this pacakage :

-   Du côté de chez Swann (1913): `ducotedechezswann`.
-   À l'ombre des jeunes filles en fleurs (1919): `alombredesjeunesfillesenfleurs`.
-   Le Côté de Guermantes (1921): `lecotedeguermantes`.
-   Sodome et Gomorrhe (1922) : `sodomeetgomorrhe`.
-   La Prisonnière (1923) :`laprisonniere`.
-   Albertine disparue (1925, also know as : La Fugitive) : `albertinedisparue`.
-   Le Temps retrouvé (1927) : `letempretrouve`.

Find your way into {proustr}
----------------------------

{proustr} is divided into two type of functions :

-   `proust_*()` functions return data objects (books, characters, stop words, random Proust extract...)

-   `pr_*()` functions perform actions on the data. `pr` is short for p(roust)r, pr(oust), p(rocessing f)r(ench), or anything you can think of :). This shortcode refers to functions like `pr_clean_punc()`.

`proust_*()` functions
----------------------

### `proust_books()`

Get the tibble with all the books :

``` r
library(proustr)
proust_books()
#> # A tibble: 4,690 x 4
#>                                                                           text
#>  *                                                                       <chr>
#>  1 "Longtemps, je me suis couché de bonne heure. Parfois, à peine ma bougie ét
#>  2 J'appuyais tendrement mes joues contre les belles joues de l'oreiller qui, 
#>  3 Je me rendormais, et parfois je n'avais plus que de courts réveils d'un ins
#>  4 Quelquefois, comme Ève naquit d'une côte d'Adam, une femme naissait pendant
#>  5 Un homme qui dort tient en cercle autour de lui le fil des heures, l'ordre 
#>  6 "Peut-être l'immobilité des choses autour de nous leur est-elle imposée par
#>  7 Puis renaissait le souvenir d'une nouvelle attitude ; le mur filait dans un
#>  8 Ces évocations tournoyantes et confuses ne duraient jamais que quelques sec
#>  9 Certes, j'étais bien éveillé maintenant : mon corps avait viré une dernière
#> 10 "À Combray, tous les jours dès la fin de l'après-midi, longtemps avant le m
#> # ... with 4,680 more rows, and 3 more variables: book <chr>,
#> #   volume <chr>, year <dbl>
```

### `proust_characters()`

`proust_characters` returns a tibble with each characters from the books.

``` r
proust_characters()
#> # A tibble: 461 x 1
#>              perso
#>  *           <chr>
#>  1            A.J.
#>  2    Académicien 
#>  3        Adolphe 
#>  4      Agrigente 
#>  5      Agrigente 
#>  6            Aimé
#>  7 Albaret Céleste
#>  8          Albert
#>  9       Albertine
#> 10           Albon
#> # ... with 451 more rows
```

### `proust_random()`

Create your own Proust text with the proust\_random() function :

``` r
proust_random()
[1] "Cette voix était restée la même, inutilement chaude, prenante, avec un rien d’accent anglais."

purrr::map(1:5, proust_random)

[[1]]
[1] "Du reste cette réaction des matériaux locaux sur le génie qui les utilise et à qui elle donne plus de verdeur ne rend pas l’œuvre moins individuelle, et que ce soit celle d’un architecte, d’un ébéniste, ou d’un musicien, elle ne reflète pas moins minutieusement les traits les plus subtils de la personnalité de l’artiste, parce qu’il a été forcé de travailler dans la pierre meulière de Senlis ou le grès rouge de Strasbourg, qu’il a respecté les nœuds particuliers au frêne, qu’il a tenu compte dans son écriture des ressources et des limites, de la sonorité, des possibilités, de la flûte ou de l’alto."

[[2]]
[1] "Aussi bien, pas plus que les saisons à ses bras de mer infleurissables, les modernes années n’apportent de changement à la cité gothique ; je le savais, je ne pouvais l’imaginer, mais voilà ce que je voulais contempler, de ce même désir qui jadis, quand j’étais enfant, dans l’ardeur même du départ, avait brisé en moi la force de partir ; je voulais me trouver face à face avec mes imaginations vénitiennes ; voir comment cette mer divisée enserrait de ses méandres, comme les replis du fleuve Océan, une civilisation urbaine et raffinée, mais qui, isolée par leur ceinture azurée, s’était développée à part, avait eu à part ses écoles de peinture et d’architecture ; admirer ce jardin fabuleux de fruits et d’oiseaux de pierre de couleur, fleuri au milieu de la mer, qui venait le rafraîchir, frappait de son flux le fût des colonnes et, sur le puissant relief des chapiteaux, comme un regard de sombre azur qui veille dans l’ombre, posait par taches et fait remuer perpétuellement la lumière. Ne doutant pas que ce fût pour montrer qu’ils n’étaient pas intimidés par les titres, elle souhaitait d’imiter leur fierté, mais n’avait pas bien saisi par quelle forme grammaticale elle se traduisait."

[[3]]
[1] "Legrandin qui, retenu à Paris par sa profession d’ingénieur, ne pouvait, en dehors des grandes vacances, venir à sa propriété de Combray que du samedi soir au lundi matin. » Il avait bien pensé dans sa tendresse paternelle et pour émouvoir son fils à faire venir  l’instrument. Il me parla de la grande chaleur qu’il faisait ces jours-ci, mais, bien qu’il fût lettré et eût pu s’exprimer en bon français, il me dit : « Vous ne souffrez pas de cette hyperthermie ?"

[[4]]
[1] "À côté de leur immensité, je trouvai qu’un coup de chapeau serait mesquin et pourrait faire supposer à mon oncle que je ne me croyais pas tenu envers lui à plus qu’à une banale politesse. Comme ce n’était pas un lundi, nous ne savions pas si nous trouverions Mme Verdurin, car sauf ce jour-là, où elle recevait, il était imprudent d’aller la voir à l’improviste. Les mêmes noms de lieux, si troublants pour moi jadis que le simple Annuaire des Châteaux, feuilleté au chapitre du département de la Manche, me causait autant d’émotion que l’Indicateur des chemins de fer, m’étaient devenus si familiers que cet indicateur même, j’aurais pu le consulter, à la page Balbec-Douville par Doncières, avec la même heureuse tranquillité qu’un dictionnaire d’adresses. » Et elle dit à son institutrice de se dépêcher. — Mais, lui dis-je, est-ce que cela n’ennuie pas votre père ? — Pas le moins du monde. — Cependant, il avait peur que cela ne semble bizarre à cause de cet anniversaire. — Qu’est-ce que cela peut me faire ce que les autres pensent ?"

[[5]]
[1] "Tout d’un coup, sur le sable de l’allée, tardive, alentie et luxuriante comme la plus belle fleur et qui ne s’ouvrirait qu’à midi, Mme Swann apparaissait, épanouissant autour d’elle une toilette toujours différente mais que je me rappelle surtout mauve ; puis elle hissait et déployait sur un long pédoncule, au moment de sa plus complète irradiation, le pavillon de soie d’une large ombrelle de la même nuance que l’effeuillaison des pétales de sa robe. Comment ? Derrière la barrière parfumée que lui faisait la beauté choisie, il était isolé au milieu d’un salon comme au milieu d’une salle de spectacle dans une loge et, quand on venait le saluer, au travers pour ainsi dire de la beauté de sa compagne, il était excusable de répondre fort brièvement et sans s’interrompre de parler à une femme. Elle et son mari furent, d’ailleurs, ainsi que le prince d’Agrigente, invités à ce dîner, que Mme Bontemps et Cottard eurent deux manières de raconter, selon les personnes à qui ils s’adressaient. Huit jours avant les Rogations !"
```

### `proust_stopwords()`

You can get a tibble of stopwords with:

``` r
proust_stopwords()
```

### `proust_sentiments()`

Sentiment lexicon is launched with:

``` r
proust_sentiments()
#> # A tibble: 14,127 x 2
#>               word polarity
#>  *           <chr>    <chr>
#>  1 à ce endroit là positive
#>  2       à le hâte negative
#>  3          à part negative
#>  4           à pic negative
#>  5      à rallonge negative
#>  6      abasourdir negative
#>  7        ablation negative
#>  8      abominable negative
#>  9          abrupt negative
#> 10          absent negative
#> # ... with 14,117 more rows
```

You can chose between polarity (positive or negative, which is the default behavior), or a score on six sentiments (joy, fear, sadness, anger, surprise, disgust) with `type = "score"`.

`pr_*()` functions
------------------

Please bear in mind that all these functions are designed to work with a data.frame.

### `pr_detect_days()`

Detects the days from a data.frame (in French).

``` r
a <- data.frame(text = c("C'était lundi 1er mars et mardi 2", "Et mercredi 3", "Il est revenu jeudi."))
pr_detect_days(a, text)
#> # A tibble: 3 x 3
#>                                text      days n_days
#> *                            <fctr>    <list>  <int>
#> 1 C'était lundi 1er mars et mardi 2 <chr [2]>      2
#> 2                     Et mercredi 3 <chr [1]>      1
#> 3              Il est revenu jeudi. <chr [1]>      1
```

### `pr_detect_months()`

Detects the months from a data.frame (in French).

``` r
pr_detect_months(a, text)
#> # A tibble: 3 x 3
#>                                text    months n_months
#> *                            <fctr>    <list>    <int>
#> 1 C'était lundi 1er mars et mardi 2 <chr [1]>        1
#> 2                     Et mercredi 3 <chr [0]>        0
#> 3              Il est revenu jeudi. <chr [0]>        0
```

### `pr_detect_pro()`

Detects the pronouns from a data.frame (in French). The shortcuts in the pronoun col stand for : + pps: first person singular (première personne du singulier) + dps: second person singular (deuxième personne du singulier) + tps: third person singular (troisième personne du singulier) + ppp: first person plural (première personne du pluriel) + dpp: second person singular (deuxième personne du pluriel) + tpp: third person singular (troisième personne du pluriel)

``` r
a <- proust_books()[1,]
a <- pr_detect_pro(a, text)
dplyr::select(a, -text)
#> # A tibble: 2 x 5
#>                    book                    volume  year pronoun count
#> *                 <chr>                     <chr> <dbl>   <chr> <int>
#> 1 Du côté de chez Swann Première partie : Combray  1913     pps    26
#> 2 Du côté de chez Swann Première partie : Combray  1913     tps    13
```

### `pr_normalize_punc()`

French has a weird punctuation use. For example, quotes are `«` and `»`, instead of `"`. Other strange characters may include `՚`,`︐` or `’` for apostrophe. This function removes most of the punctuation idiosyncracy you can find in a french text.

Note: books from {proustr} have already been normalized.

``` r
a <- data.frame(text = "Il l՚a dit : « La ponctuation est chelou » !")
pr_normalize_punc(a, text)
#> # A tibble: 1 x 1
#>                                             text
#> *                                          <chr>
#> 1 "Il l'a dit : \"La ponctuation est chelou\" !"
```

Why bother? Some text-mining tools perform a split with `'`, not with `՚`, a behavior which can lead to some error when tokenizing a text.

### `pr_stem()`

Turn your text into stems. This is an implementation of the {SnowballC} package in {proustr}.Please keep in mind that punctuation and capital letters are removed by this function.

You can stem a data.frame with a column containing sentences with `pr_stem_sentences` :

``` r
a <- proustr::laprisonniere[1:10,]
pr_stem_sentences(a, text)
#> # A tibble: 10 x 4
#>                                                                           text
#>  *                                                                       <chr>
#>  1 des le matin la têt encor tourn contr le mur et avant d'avoir vu au dessus 
#>  2 quand je pens mainten que mon ami était venu à notr retour de balbec habit 
#>  3 quand albertin sav par françois que dan la nuit de ma chambr aux rideau enc
#>  4                  le douleur sont de foll et qui le écout est encor plus fou
#>  5 je l'aim trop pour ne pas joyeux sourir de son mauv goût musical cet chanso
#>  6                                    une chanson d'adieu sort de sourc troubl
#>  7 une nu pass elle éclips le soleil je voi s'éteindr et rentr dan une grisail
#>  8 le cloison qui sépar nos deux cabinet de toilet celui d'albertin tout parei
#>  9 d'autr fois je rest couch rêv auss longtemp que je le voul car on avait ord
#> 10 je son françois j'ouvr le figaro j'y cherch et constat que ne s'y trouv pas
#> # ... with 3 more variables: book <chr>, volume <chr>, year <dbl>
```

Or a column with words with `pr_stem_words` :

``` r
a <- data.frame(words = c("matin", "heure", "fatigué","sonné","lois", "tests","fusionner"))
pr_stem_words(a, words)
#> # A tibble: 7 x 1
#>    words
#> *  <chr>
#> 1  matin
#> 2   heur
#> 3 fatigu
#> 4    son
#> 5   lois
#> 6   test
#> 7 fusion
```

Install proustr
---------------

Install this package directly in R :

``` r
install.packages("proustr")
```

From Github :

``` r
devtools::install_github("ColinFay/proustr")
```

### Contact

Questions and feedbacks [welcome](mailto:contact@colinfay.me)!

You want to contribute ? Open a [PR](https://github.com/ColinFay/proustr/pulls) :) If you encounter a bug or want to suggest an enhancement, please [open an issue](https://github.com/ColinFay/proustr/issues).
