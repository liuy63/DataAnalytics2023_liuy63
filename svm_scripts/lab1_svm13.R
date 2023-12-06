cv.folds <- function(n,folds=3)
 ## randomly split the n samples into folds
 {
  split(sample(n),rep(1:folds,length=length(y)))
 }

# Write a function cv.ksvm <- function(x,y,folds=3,...) which returns a vector ypred of predicted decision score for all points by k-fold cross-validation.
# Compute the various performance of the SVM by 5-fold cross-validation. Alter- natively, the ksvm function can automatically compute the k-fold cross-validation accuracy:

cv.ksvm <- function(x, y, folds = 3, ...) {
  n <- nrow(x)
  indices <- cv.folds(n, folds)
  ypred <- rep(NA, n)
  
  for (i in 1:folds) {
    testIndices <- indices[[i]]
    trainIndices <- setdiff(1:n, testIndices)
    
    xtrain <- x[trainIndices, , drop = FALSE]
    ytrain <- y[trainIndices]
    xtest <- x[testIndices, , drop = FALSE]
    
    model <- ksvm(xtrain, ytrain, type = "C-svc", ...)
    
    # Predicting and storing the results
    ypred[testIndices] <- predict(model, xtest)
  }
  
  return(ypred)
}

library(kernlab)

set.seed(123)
x <- rbind(matrix(rnorm(120),,2), matrix(rnorm(120, mean = 3),,2))
y <- c(rep(1, 60), rep(-1, 60))

ypred <- cv.ksvm(x, y, folds = 5, kernel = 'vanilladot', C = 1, scaled = c())

svp <- ksvm(x,y,type="C-svc",kernel='vanilladot',C=1,scaled=c(),cross=5)
print(cross(svp))

