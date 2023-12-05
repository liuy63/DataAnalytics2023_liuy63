# PCA with iris dataset
data("iris")
head(iris)

# creating another dataset from iris dataset that contains the columns from 1 to 4
irisdata1 <- iris[,1:4]
irisdata1
head(irisdata1)
principal_components <- princomp(irisdata1, cor = TRUE, score = TRUE)
summary(principal_components)
# in the summary you can see that it has four Principal Components it is 
# becasue the input data has four different features.
# using the plot() function, we can plot the principal components.
plot(principal_components)
# plotting the principal_components using the a line in plot() functions
plot(principal_components, type = "l")
# using rhw biplot() function we can plot the components
biplot(principal_components)
