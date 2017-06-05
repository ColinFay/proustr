## This is the script used to read txt files and
## add them to the package

library(tidyverse)

ducotedechezswann1 <- read_lines("data-raw/Proust-01.txt") 
ducotedechezswann2 <- read_lines("data-raw/Proust-02.txt")
alombredesjeunesfillesenfleurs1 <- read_lines("data-raw/Proust-03.txt")
alombredesjeunesfillesenfleurs2 <- read_lines("data-raw/Proust-04.txt")
alombredesjeunesfillesenfleurs3 <- read_lines("data-raw/Proust-05.txt")
lecotedeguermantes1 <- read_lines("data-raw/Proust-06.txt")
lecotedeguermantes2 <- read_lines("data-raw/Proust-07.txt")
lecotedeguermantes3 <- read_lines("data-raw/Proust-08.txt")
sodomeetgomorrhe1 <- read_lines("data-raw/Proust-09.txt")
sodomeetgomorrhe2 <- read_lines("data-raw/Proust-10.txt")
laprisonniere1 <- read_lines("data-raw/Proust-11.txt")
laprisonniere2 <- read_lines("data-raw/Proust-12.txt")
albertinedisparue <- read_lines("data-raw/Proust-13.txt")
letempretrouve1 <- read_lines("data-raw/Proust-14.txt")
letempretrouve2 <- read_lines("data-raw/Proust-15.txt")

## Add data 

devtools::use_data(ducotedechezswann1, overwrite = TRUE)
devtools::use_data(ducotedechezswann2, overwrite = TRUE)
devtools::use_data(alombredesjeunesfillesenfleurs1, overwrite = TRUE)
devtools::use_data(alombredesjeunesfillesenfleurs2, overwrite = TRUE)
devtools::use_data(alombredesjeunesfillesenfleurs3, overwrite = TRUE)
devtools::use_data(lecotedeguermantes1, overwrite = TRUE)
devtools::use_data(lecotedeguermantes2, overwrite = TRUE)
devtools::use_data(lecotedeguermantes3, overwrite = TRUE)
devtools::use_data(sodomeetgomorrhe1, overwrite = TRUE)
devtools::use_data(sodomeetgomorrhe2, overwrite = TRUE)
devtools::use_data(laprisonniere1, overwrite = TRUE)
devtools::use_data(laprisonniere2, overwrite = TRUE)
devtools::use_data(albertinedisparue, overwrite = TRUE)
devtools::use_data(letempretrouve1, overwrite = TRUE)
devtools::use_data(letempretrouve2, overwrite = TRUE)