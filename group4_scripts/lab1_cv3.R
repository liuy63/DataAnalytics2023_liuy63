install.packages("robustbase")
install.packages("cvTools")
library("robustbase")
require(cvTools)
data("coleman")
set.seed(1234) # set seed for reproducibility
## set up folds for cross-validation
folds <- cvFolds(nrow(coleman), K = 5, R = 10)
## compare raw and reweighted LTS estimators for
## 50% and 75% subsets
# 50% subsets
fitLts50 <- ltsReg(Y ~ ., data = coleman, alpha = 0.5)
cvFitLts50 <- cvLts(fitLts50, cost = rtmspe, folds = folds,
fit = "both", trim = 0.1)
# 75% subsets
fitLts75 <- ltsReg(Y ~ ., data = coleman, alpha = 0.75)
cvFitLts75 <- cvLts(fitLts75, cost = rtmspe, folds = folds,
fit = "both", trim = 0.1)
# combine results into one object
cvFitsLts <- cvSelect("0.5" = cvFitLts50, "0.75" = cvFitLts75)
cvFitsLts
# "cv" object
ncv(cvFitLts50) 
# [1] 2
nfits(cvFitLts50)
# NULL
cvNames(cvFitLts50)
# [1] "reweighted" "raw"       
cvNames(cvFitLts50) <- c("improved", "initial")
fits(cvFitLts50)
# NULL
cvFitLts50
# 5-fold CV results:
#   improved  initial 
# 1.165749 1.528544 
# "cvSelect" object
ncv(cvFitsLts)
# [1] 2
nfits(cvFitsLts)
# [1] 2

cvNames(cvFitsLts)
cvNames(cvFitsLts) <- c("improved", "initial")
fits(cvFitsLts)
fits(cvFitsLts) <- 1:2
cvFitsLts
