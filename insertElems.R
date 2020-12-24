insertElems = function(vect, pos, elems) {

l = length(vect)
  j = 0
  for (i in 1:length(pos)){
    if (pos[i]==1)
      vect = c(elems[j+1], vect)
    else if (pos[i] == length(vect)+1)
      vect = c(vect, elems[j+1])
    else
      vect = c(vect[1:(pos[i]-1+j)], elems[j+1], vect[(pos[i]+j):(l+j)])
    j = j+1
  }
  return(vect)
}

#e.g.
tmp = c(3,4,5,6,7)
tmp
insertElems(tmp, c(2,4,5), c(NA,NA,NA))
