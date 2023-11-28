library(cvTools)
library(robustbase)
data(coleman)
call <- call("lmrob", formula = Y ~ .)
# set up folds for cross-validation
folds <- cvFolds(nrow(coleman), K = 5, R = 10)
# perform cross-validation
cvTool(call, data = coleman, y = coleman$Y, cost = rtmspe, folds = folds, costArgs = list(trim = 0.1))
#vary K and R
#look at cvfits, use densityplot, 
tuning <- list(tuning.psi=seq(2., 6., 20))
cvFitsLmrob <- cvTuning(call, data = coleman, y = coleman$Y, tuning = tuning, cost = rtmspe, folds = folds, costArgs = list(trim = 0.1))
# look at output
cvFitsLmrob
# 5-fold CV results:
#   tuning.psi       CV
# 1          2 1.367166
# 
# Optimal tuning parameter:
#    tuning.psi
# CV          2

# summarize
aggregate(cvFitsLmrob, summary)

#   tuning.psi  CV.Min. CV.1st Qu. CV.Median  CV.Mean
# 1          2 1.051904   1.147804  1.296246 1.367166
#   CV.3rd Qu.  CV.Max.
# 1   1.392548 2.361834
