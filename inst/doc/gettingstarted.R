## ------------------------------------------------------------------------
library(proustr)
proust_books()

## ------------------------------------------------------------------------
proust_characters()

## ----eval = FALSE--------------------------------------------------------
#  proust_random()
#  [1] "Cette voix était restée la même, inutilement chaude, prenante, avec un rien d’accent anglais."
#  
#  purrr::map(1:5, proust_random)
#  
#  [[1]]
#  [1] "Du reste cette réaction des matériaux locaux sur le génie qui les utilise et à qui elle donne plus de verdeur ne rend pas l’œuvre moins individuelle, et que ce soit celle d’un architecte, d’un ébéniste, ou d’un musicien, elle ne reflète pas moins minutieusement les traits les plus subtils de la personnalité de l’artiste, parce qu’il a été forcé de travailler dans la pierre meulière de Senlis ou le grès rouge de Strasbourg, qu’il a respecté les nœuds particuliers au frêne, qu’il a tenu compte dans son écriture des ressources et des limites, de la sonorité, des possibilités, de la flûte ou de l’alto."
#  
#  [[2]]
#  [1] "Aussi bien, pas plus que les saisons à ses bras de mer infleurissables, les modernes années n’apportent de changement à la cité gothique ; je le savais, je ne pouvais l’imaginer, mais voilà ce que je voulais contempler, de ce même désir qui jadis, quand j’étais enfant, dans l’ardeur même du départ, avait brisé en moi la force de partir ; je voulais me trouver face à face avec mes imaginations vénitiennes ; voir comment cette mer divisée enserrait de ses méandres, comme les replis du fleuve Océan, une civilisation urbaine et raffinée, mais qui, isolée par leur ceinture azurée, s’était développée à part, avait eu à part ses écoles de peinture et d’architecture ; admirer ce jardin fabuleux de fruits et d’oiseaux de pierre de couleur, fleuri au milieu de la mer, qui venait le rafraîchir, frappait de son flux le fût des colonnes et, sur le puissant relief des chapiteaux, comme un regard de sombre azur qui veille dans l’ombre, posait par taches et fait remuer perpétuellement la lumière. Ne doutant pas que ce fût pour montrer qu’ils n’étaient pas intimidés par les titres, elle souhaitait d’imiter leur fierté, mais n’avait pas bien saisi par quelle forme grammaticale elle se traduisait."
#  
#  [[3]]
#  [1] "Legrandin qui, retenu à Paris par sa profession d’ingénieur, ne pouvait, en dehors des grandes vacances, venir à sa propriété de Combray que du samedi soir au lundi matin. » Il avait bien pensé dans sa tendresse paternelle et pour émouvoir son fils à faire venir  l’instrument. Il me parla de la grande chaleur qu’il faisait ces jours-ci, mais, bien qu’il fût lettré et eût pu s’exprimer en bon français, il me dit : « Vous ne souffrez pas de cette hyperthermie ?"
#  
#  [[4]]
#  [1] "À côté de leur immensité, je trouvai qu’un coup de chapeau serait mesquin et pourrait faire supposer à mon oncle que je ne me croyais pas tenu envers lui à plus qu’à une banale politesse. Comme ce n’était pas un lundi, nous ne savions pas si nous trouverions Mme Verdurin, car sauf ce jour-là, où elle recevait, il était imprudent d’aller la voir à l’improviste. Les mêmes noms de lieux, si troublants pour moi jadis que le simple Annuaire des Châteaux, feuilleté au chapitre du département de la Manche, me causait autant d’émotion que l’Indicateur des chemins de fer, m’étaient devenus si familiers que cet indicateur même, j’aurais pu le consulter, à la page Balbec-Douville par Doncières, avec la même heureuse tranquillité qu’un dictionnaire d’adresses. » Et elle dit à son institutrice de se dépêcher. — Mais, lui dis-je, est-ce que cela n’ennuie pas votre père ? — Pas le moins du monde. — Cependant, il avait peur que cela ne semble bizarre à cause de cet anniversaire. — Qu’est-ce que cela peut me faire ce que les autres pensent ?"
#  
#  [[5]]
#  [1] "Tout d’un coup, sur le sable de l’allée, tardive, alentie et luxuriante comme la plus belle fleur et qui ne s’ouvrirait qu’à midi, Mme Swann apparaissait, épanouissant autour d’elle une toilette toujours différente mais que je me rappelle surtout mauve ; puis elle hissait et déployait sur un long pédoncule, au moment de sa plus complète irradiation, le pavillon de soie d’une large ombrelle de la même nuance que l’effeuillaison des pétales de sa robe. Comment ? Derrière la barrière parfumée que lui faisait la beauté choisie, il était isolé au milieu d’un salon comme au milieu d’une salle de spectacle dans une loge et, quand on venait le saluer, au travers pour ainsi dire de la beauté de sa compagne, il était excusable de répondre fort brièvement et sans s’interrompre de parler à une femme. Elle et son mari furent, d’ailleurs, ainsi que le prince d’Agrigente, invités à ce dîner, que Mme Bontemps et Cottard eurent deux manières de raconter, selon les personnes à qui ils s’adressaient. Huit jours avant les Rogations !"

## ----eval = FALSE--------------------------------------------------------
#  proust_stopwords()

## ------------------------------------------------------------------------
proust_sentiments()

## ------------------------------------------------------------------------
a <- data.frame(text = c("C'était lundi 1er mars et mardi 2", "Et mercredi 3", "Il est revenu jeudi."))
pr_detect_days(a, text)

## ------------------------------------------------------------------------
pr_detect_months(a, text)

## ------------------------------------------------------------------------
a <- proust_books()[1,]
a <- pr_detect_pro(a, text)
dplyr::select(a, -text)

## ------------------------------------------------------------------------
a <- data.frame(text = "Il l՚a dit : « La ponctuation est chelou » !")
pr_normalize_punc(a, text)

## ------------------------------------------------------------------------
a <- proustr::laprisonniere[1:10,]
pr_stem_sentences(a, text)

## ------------------------------------------------------------------------
a <- data.frame(words = c("matin", "heure", "fatigué","sonné","lois", "tests","fusionner"))
pr_stem_words(a, words)

## ----eval = FALSE--------------------------------------------------------
#  install.packages("proustr")

## ----eval = FALSE--------------------------------------------------------
#  devtools::install_github("ColinFay/proustr")

