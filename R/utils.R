length_list <- function(vec){
  if(length(vec) == 0){
    return(NA)
  } else {
    unlist(lapply(vec, length))
  }
}
