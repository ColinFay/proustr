length_list <- function(vec){
  if(length(vec) == 0){
    return(NA)
  } else {
    lapply(vec, length) %>% unlist
  }
}
