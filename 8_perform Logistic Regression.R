college <- read.csv("https://raw.githubusercontent.com/ropensci/datapack/main/inst/extdata/pkg-example/binary.csv")
college <- read.csv("C:\\Users\\Mandar\\Downloads\\studentmarks.csv")
head(college)
nrow(college)

install.packages("caTools")
library(caTools)
set.seed(123)
split <- sample.split(college$admit, SplitRatio = 0.75)
training_reg <- subset(college, split == TRUE)
test_reg <- subset(college, split == FALSE)

fit_logistic_model <- glm(admit ~ ., data = training_reg, family = "binomial")

predict_reg <- predict(fit_logistic_model, test_reg, type = "response")

cdplot(as.factor(admit) ~ gpa, data = college)
cdplot(as.factor(admit) ~ gre, data = college)
cdplot(as.factor(admit) ~ rank, data = college)

predict_reg <- ifelse(predict_reg > 0.5, 1, 0)

table(test_reg$admit, predict_reg)
