dataset = read.csv("C:\\Users\\Mandar\\Downloads\\Social_Network_Ads.csv")
dataset = dataset[3:5]
print(dataset)
print(dataset$Purchased)

install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
print(training_set)
test_set = subset(dataset, split == FALSE)
print(test_set)

training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
print(training_set[-3])
print(test_set[-3])

install.packages('e1071')
library(e1071)
classifier = svm(formula = Purchased ~ ., 
                 data = training_set, 
                 type = 'C-classification', 
                 kernel = 'linear')
print(classifier)

y_pred = predict(classifier, newdata = test_set[-3])
print(y_pred)

cm = table(test_set[, 3], y_pred)
print(cm)
