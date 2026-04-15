# Step 1: Apply K-Means Clustering
kmeans_result <- kmeans(x = dataset, centers = 5)
y_kmeans <- kmeans_result$cluster

# Step 2: Visualize the Clusters
library(cluster)
clusplot(dataset, y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         main = 'Cluster of Customers',
         xlab = 'Annual Income',
         ylab = 'Spending Score')
