# Question 3: 

# Loading required libraries
library(ggplot2)
library(cluster)

# Setting the seed for reproducibility
set.seed(42)

# Create a random dataset with specified ranges for columns
num_demigods <- 500
num_powers <- 10

# Generate random values for powers 1 to 4 (Strength: -10 to 10)
power_strength_1to4 <- runif(num_demigods * 4, min = -10, max = 10)

# Generate random values for powers 5 to 8 (Speed: 10 to 20)
power_speed_5to8 <- runif(num_demigods * 4, min = 10, max = 20)

# Generate random values for powers 9 to 10 (Intelligence: -100 to 100)
power_intelligence_9to10 <- runif(num_demigods * 2, min = -100, max = 100)

# Combining all powers into the final dataset
half_blood_powers <- cbind(power_strength_1to4, power_speed_5to8, power_intelligence_9to10)

# i)  Applying Prophecy Clustering
prophecy_clusters <- lapply(1:10, function(k) {
  kmeans(half_blood_powers, centers = k)
})

# Extracting total within-cluster sum of squares for each clustering result
within_cluster_sums <- sapply(prophecy_clusters, function(x) x$tot.withinss)

# Plotting distance metric graph for Prophecy Clustering
ggplot(data.frame(K = 1:10, WithinSS = within_cluster_sums), aes(x = K, y = WithinSS)) +
  geom_line() +
  geom_point() +
  labs(title = "Prophecy Clustering - Elbow Method",
       x = "Number of Clusters (K)",
       y = "Within-Cluster Sum of Squares")

# ii) Applying Chiron Clustering (Hierarchical clustering)
chiron_clusters <- hclust(dist(half_blood_powers))

# Plotting distance metric graph for Chiron Clustering
ggdendrogram(chiron_clusters)
