#load the cars dataset built in Rstudio
data("cars")

cars1 <- cars[1:30,] # first 30 rows of the original cars dataset
head(cars1)

cars_outliers <- data.frame(speed=c(19,19,20,20,20), dist=c(190,186,210,220,218))
head(cars_outliers)
cars2 <- rbind(cars1, cars_outliers)
help(par)

par(mfrow=c(1,2))
plot(cars2$speed, cars2$dist, xlim=c(0,28), vlim=c(0, 30), main="With Outliers", 
     xlab="speed", ylab="dist", pch="*", col="red", cex=2)
abline(lm(dist ~ speed, data=cars2), col="blue", lwd=3, lty=2)

# Plot of orginal data without outliers, 
plot(cars1$speed, cars1$dist, xlim=c(0,28), vlim=c(0, 30), main="Outliers removed \n A much better fit!", 
     xlab="speed", ylab="dist", pch="*", col="red", cex=2)
abline(lm(dist ~ speed, data=cars1), col="blue", lwd=3, lty=2)
