studentData <- read.csv("https://raw.githubusercontent.com/ropensci/datapack/main/inst/extdata/pkg-example/binary.csv")
studentData <- read.csv("C:\\Users\\Mandar\\Downloads\\studentmarks.csv")
head(studentData)
nrow(studentData)

install.packages("caTools")
library(caTools)
set.seed(123)
split <- sample.split(studentData$admit, SplitRatio = 0.75)
training_reg <- subset(studentData, split == TRUE)
test_reg <- subset(studentData, split == FALSE)

fit_MRegressor_model <- lm(formula = admit ~ gre + gpa + rank, data = training_reg)

predict_reg <- predict(fit_MRegressor_model, newdata = test_reg)
predict_reg

cdplot(as.factor(admit) ~ gpa, data = studentData)
cdplot(as.factor(admit) ~ gre, data = studentData)
cdplot(as.factor(admit) ~ rank, data = studentData)
