require(rpart)

data("Titanic")

# decision tree model
tree <- rpart(Survived ~ Age, data = Titanic)

# visualize
printcp(tree)
plotcp(tree)
summary(tree)

ti <- tree(Survived ~ ., data=Titanic)
summary(ti)
ti$frame
plot(ti)
text(ti)
