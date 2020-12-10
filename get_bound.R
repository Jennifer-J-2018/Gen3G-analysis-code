get_bound = function(reg1 = model_child_pre_pregnancy_maternal_BMI){
  library(tidyverse)
  library(sandwich)
  
  ## Generate a prediction DF
  pred_df <- data.frame(fit = predict(reg1))
  
  ## Get the design matrix
  X_mat <- model.matrix(reg1)
  
  ## Get HAC VCOV matrix and calculate SEs
  v_hac <- NeweyWest(reg1, prewhite = FALSE, adjust = FALSE) ## HAC VCOV (adjusted for small data sample)
  #> Warning in meatHAC(x, order.by = order.by, prewhite = prewhite, weights =
  #> weights, : more weights than observations, only first n used
  var_fit_hac <- rowSums((X_mat %*% v_hac) * X_mat)  ## Point-wise variance for predicted mean
  se_fit_hac <- sqrt(var_fit_hac) ## SEs
  
  ## Add these to pred_df and calculate the 95% CI
  pred_df <-
    pred_df %>%
    mutate(se_fit_hac = se_fit_hac) %>%
    mutate(
      lwr_hac = fit - qt(0.975, df=reg1$df.residual)*se_fit_hac,
      upr_hac = fit + qt(0.975, df=reg1$df.residual)*se_fit_hac
    )
  
  return(pred_df)
}