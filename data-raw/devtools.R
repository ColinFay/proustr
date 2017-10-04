# Devtools 

library(devtools)

# init stuffs
use_code_of_conduct()
use_cran_badge()
use_mit_license()
use_news_md()
use_readme_rmd()
use_testthat()
use_travis()

#init tests 
use_test("init")
use_test("clean-punc")
use_test("detect-calendar")
use_test("detect-pronouns")
use_test("stem")
use_test("error")

# init vignette
use_vignette("getting started")
build_vignettes()

# dependencies
use_package("dplyr")
use_package("magrittr")
use_package("stringr")
use_package("purrr")
use_package("rlang")
use_package("tokenizers")
use_package("SnowballC")
use_package("assertthat")

# run tests 

test()
build_win()
check()

# package down
pkgdown::template_navbar()
pkgdown::build_site()
