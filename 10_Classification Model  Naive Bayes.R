# Load libraries
install.packages("e1071")
install.packages("caTools")
install.packages("caret")

library(e1071)
library(caTools)
library(caret)

# Split dataset
set.seed(123)
split <- sample.split(iris$Species, SplitRatio = 0.7)
train_cl <- subset(iris, split == TRUE)
test_cl <- subset(iris, split == FALSE)

# Fit Naive Bayes
set.seed(120)
classifier_cl <- naiveBayes(Species ~ ., data = train_cl)
print(classifier_cl)

# Predict
y_pred <- predict(classifier_cl, newdata = test_cl)

# Confusion matrix
cm <- table(test_cl$Species, y_pred)
print(cm)

confusionMatrix(cm)
