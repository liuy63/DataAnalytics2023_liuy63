# Lab 1, part 1

EPI_data <- read.csv("EPI_data_2010.csv")

# change first row to header
names(EPI_data) <- as.matrix(EPI_data[1,])
EPI_data <- EPI_data[-1,]
EPI_data[] <- lapply(EPI_data, function(x) type.convert(as.character(x)))
EPI_data

View(EPI_data)

attach(EPI_data) 	# sets the ‘default’ object
fix(EPI_data) 	# launches a simple data editor
EPI 			# prints out values EPI_data$EPI
tf <- is.na(EPI) # records True values if the value is NA
E <- EPI[!tf] # filters out NA values, new array

#summary
summary(EPI) 	# stats
fivenum(EPI,na.rm=TRUE)
help(stem)
stem(EPI)		 # stem and leaf plot
help(hist)
hist(EPI)
hist(EPI, seq(30., 95., 1.0), prob=TRUE)
help(lines)
lines(density(EPI,na.rm=TRUE,bw=1.)) # or try bw=“SJ”
help(rug)
rug(EPI) 

# EPI data
plot(ecdf(EPI), do.points=FALSE, verticals=TRUE)

par(pty="s")
qqnorm(EPI); qqline(EPI)

x <- seq(30, 95, 1)
qqplot(qt(ppoints(250), df=5), x, xlab="Q-Q plot for t dsn")
qqline(x)

# DALY data
plot(ecdf(DALY), do.points=FALSE, verticals=TRUE)

par(pty="s")
qqnorm(DALY); qqline(DALY)

# WATER_H
plot(ecdf(WATER_H), do.points=FALSE, verticals=TRUE)

par(pty="s")
qqnorm(WATER_H); qqline(WATER_H)

# comparing distributions
boxplot(EPI, DALY)
qqplot(EPI, DALY)

boxplot(EPI, ENVHEALTH, ECOSYSTEM, DALY, AIR_H, WATER_H, AIR_E, WATER_E, BIODIVERSITY)
qqplot(EPI, ENVHEALTH)

# Conditional filtering
EPILand <- EPI[!Landlock]
Eland <- EPILand[!is.na(EPILand)]
hist(Eland)
hist(Eland, seq(30., 95., 1.0), prob=TRUE)

boxplot(Eland)

# Part 2
plot(ecdf(EPI), do.points=FALSE, verticals=TRUE)

par(pty="s")
qqnorm(EPI); qqline(EPI)

x <- seq(30, 95, 1)
qqplot(qt(ppoints(250), df=5), x, xlab="Q-Q plot for t dsn")
qqline(x)

plot(ecdf(EPI_data$EPI), do.points=FALSE, verticals = TRUE)
plot(ecdf(EPI_data$EPI), do.points=TRUE, verticals = TRUE)
par(pty="s")
help("qqnorm")
help("qqplot")
qqnorm(EPI_data$EPI)
qqline(EPI_data$EPI) #adding the line on the Q-Q plot
x <- seq(30, 95, 1)
x
x2 <- seq(30, 95, 2)
x2
x2 <- seq(30, 96, 2)
x2
qqplot(qt(ppoints(250), df=5,), x, xlab = "Q-Q plot")
qqline(x)

boxplot(EPI_data$EPI, EPI_data$DALY)


# Multivariate
multivariate <- read.csv("multivariate.csv")
attach(multivariate)
mm <- lm(Homeowners~Immigrant)
mm
summary(mm)

plot(Homeowners~Immigrant)
help(abline)
abline(mm)
abline(mm, col=2, lwd=3)
