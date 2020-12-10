get_taxonomy = function(otu){
  
  taxa = colnames(otu)
  
  taxmat = matrix(nrow=length(taxa),ncol=7)
  
  #Kingdom
  for(i in 1:length(taxa)){
    st= gregexpr("k__",taxa[i])[[1]][1]+3
    ed = gregexpr("p__",taxa[i])[[1]][1]-2
    # if(is.na(ed)){
    #   ed = nchar(fit.mother_0min_3rd_sub$taxaname)[i]
    # }
    taxmat[i,1] = substr(taxa[i], st, ed)
  }
  
  #Phylum
  for(i in 1:length(taxa)){
    st= gregexpr("p__",taxa[i])[[1]][1]+3
    ed = gregexpr("c__",taxa[i])[[1]][1]-2
    # if(is.na(ed)){
    #   ed = nchar(fit.mother_0min_3rd_sub$taxaname)[i]
    # }
    taxmat[i,2] = substr(taxa[i], st, ed)
  }
  
  #Class
  for(i in 1:length(taxa)){
    st= gregexpr("c__",taxa[i])[[1]][1]+3
    ed = gregexpr("o__",taxa[i])[[1]][1]-2
    # if(is.na(ed)){
    #   ed = nchar(fit.mother_0min_3rd_sub$taxaname)[i]
    # }
    taxmat[i,3] = substr(taxa[i], st, ed)
  }
  
  #Order
  for(i in 1:length(taxa)){
    st= gregexpr("o__",taxa[i])[[1]][1]+3
    ed = gregexpr("f__",taxa[i])[[1]][1]-2
    # if(is.na(ed)){
    #   ed = nchar(fit.mother_0min_3rd_sub$taxaname)[i]
    # }
    taxmat[i,4] = substr(taxa[i], st, ed)
  }
  
  #Family
  for(i in 1:length(taxa)){
    st= gregexpr("f__",taxa[i])[[1]][1]+3
    ed = gregexpr("g__",taxa[i])[[1]][1]-2
    # if(is.na(ed)){
    #   ed = nchar(fit.mother_0min_3rd_sub$taxaname)[i]
    # }
    taxmat[i,5] = substr(taxa[i], st, ed)
  }
  
  #Genus
  for(i in 1:length(taxa)){
    st= gregexpr("g__",taxa[i])[[1]][1]+3
    ed = gregexpr("s__",taxa[i])[[1]][1]-2
    # if(is.na(ed)){
    #   ed = nchar(fit.mother_0min_3rd_sub$taxaname)[i]
    # }
    taxmat[i,6] = substr(taxa[i], st, ed)
  }
  
  #Species
  for(i in 1:length(taxa)){
    st= gregexpr("s__",taxa[i])[[1]][1]+3
    ed = nchar(taxa)[i]
    # if(is.na(ed)){
    #   ed = nchar(fit.mother_0min_3rd_sub$taxaname)[i]
    # }
    taxmat[i,7] = substr(taxa[i], st, ed)
  }
  
  colnames(taxmat) = c("Kingdom","Phylum","Class","Order","Family","Genus","Species")
  
  row.names(taxmat) = colnames(otu)
  taxmat = taxmat %>% as.data.frame()
  return(taxmat)
}
