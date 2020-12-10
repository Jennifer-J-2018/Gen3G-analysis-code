logistic_model_check = function(Blau_final.1, fit.Blau.child_or_ogtt){
  # Predict the probability (p) of diabete positivity
  probabilities <- predict(fit.Blau.child_or_ogtt, type = "response")
  predicted.classes <- ifelse(probabilities > 0.5, "pos", "neg")
  head(predicted.classes)
  
  
  #model checking
  # Select only numeric predictors
  mydata <- Blau_final.1 %>%
    dplyr::select_if(is.numeric) 
  predictors <- colnames(mydata)
  # Bind the logit and tidying the data for plot
  mydata <- mydata %>%
    mutate(logit = log(probabilities/(1-probabilities))) %>%
    gather(key = "predictors", value = "predictor.value", -logit)
  p1 = ggplot(mydata, aes(logit,predictor.value))+
    geom_point(size = 0.5, alpha = 0.5) +
    geom_smooth(method = "loess") + 
    theme_bw() + 
    facet_wrap(~predictors, scales = "free_y")
  
  p2 = car::vif(fit.Blau.child_or_ogtt)
  
  # Extract model results
  model.data <- augment(fit.Blau.child_or_ogtt) %>% 
    mutate(index = 1:n()) 
  model.data %>% top_n(3, .cooksd)
  
  
  p4 = ggplot(model.data, aes(index, .std.resid)) + 
    geom_point(aes(color = child_BMI_perc_5yo_cat), alpha = .5) +
    theme_bw()
  
  library(ggpubr)
  p5 = gghistogram(Blau_final.1, x = "Counts.sd",
                   add = "mean", rug = TRUE,
                   color = "child_BMI_perc_5yo_cat", palette = c("#00AFBB", "#E7B800"))
  
  l = list(p1,p2,p4,p5)
  return(l)
}

