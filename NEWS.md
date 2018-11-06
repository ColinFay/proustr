# proustr 0.4.0

## Breaking change 

The sentiment lexicon is no longer included in this package. It has been moved to the [{rfeel} package](https://github.com/ColinFay/rfeel), for license compatibility reasons. 

## New funs 

+ `pr_keep_only_alnum()`

## Small updates

+ Cleaned the `proust_char()` output a little bit.

# proustr 0.2.2

2017-10

- stop_words are now only ISO, and exported as a tibble with a chr column 
- new function to `unacent` a vector

# proustr 0.2.1

2017-10

- package now has his own pkgdown \o/
- dataset has one less column (which was useless)
- removed a dependency

# proustr 0.2.0

2017-09

* new `pr_` functions
* put a bunch of tests 
* built is now available with travis
* stopwords with non ascii characters are now handled

2017-08

* Cleaner dataset 
* bug corrections 
* new dataset
* new functions `proust_random()`, `proust_sentiments()` and `proust_stopwords()`.
* books alone are no longer Rd exported
* new vignette


