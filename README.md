# Useful function in data analysis
This repository is dedicated to some wrapper function for furture analysis convinience. 

**get_bound.R** is a function takes in linear model and output 95% confidence interval for predicted value as a data frame. This function could be useful in ggplot2 to plot the 95% CI as dash lines instead of shaded areas. 

**logistic_model_check.R** is a function that takes in the logistics regression and data frame and output for a visual diagnosis for logistics regression. 


----------To be expected-------------

**outlier_removal_lm.R** is a function that takes the input of dataframe and linear regression, and output the linear regression after removal of outlier by cook's distance. 

**multiple_linear_regression.R** is a function that output multivariate linear regressions with covariates adjustments, exposure, outcome as input. 

**corr_heatmap_genus.R** is a function that output the correlation of genus abundance with selected continuoous variable of interest.

**volcano_plot.R** is a function that output the volcano plot given the data frame with effect size, p value estimate, and taxon name. 

**PCoA_biplot.R** is a function that output the PCoA biplot given the data frame and cut off for correlation with PC axis (default as 0.67).


----------To be expected for clr abundance----------

**aldex.lme4_P.R** is a function that output averaged P value for all monte carlo instances for linear mixed effect model and plot it in histogram. 

**aldex.lme4_effect_size.R** is a function that output median effect size for all monte carlo instances for linear mixed effect model and plot it in histogram. 





