dataset <- read.csv("C:\\Users\\Mandar\\Downloads\\Mall_Customers.csv")
head(dataset)

dataset <- dataset[4:5]
head(dataset)

wcss <- vector()
for (i in 1:10) {
  wcss[i] <- sum(kmeans(dataset, i)$withinss)
}

plot(1:10, wcss, type = 'b',
     main = 'The Elbow Method',
     xlab = 'Number of clusters',
     ylab = 'WSS')
