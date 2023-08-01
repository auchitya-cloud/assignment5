# Question 4: 

# Loading required libraries
library(ggplot2)

# Setting the seed for reproducibility
set.seed(42)

# Creating a random dataset with values between -100 and 100
num_heroes <- 600
num_powers <- 15
avengers_dataset <- matrix(runif(num_heroes * num_powers, min = -100, max = 100), nrow = num_heroes, ncol = num_powers)

# Converting the matrix to a data frame
avengers_df <- as.data.frame(avengers_dataset)

# i) Plot Scatter graph between Power 5 and Power 6
ggplot(avengers_df, aes(x = V5, y = V6)) +
  geom_point() +
  labs(title = "Scatter plot between Power 5 and Power 6",
       x = "Power 5", y = "Power 6")

# ii) Plot histogram of each power in a single graph
melted_avengers_df <- reshape2::melt(avengers_df)
ggplot(melted_avengers_df, aes(x = value)) +
  geom_histogram(binwidth = 5) +
  facet_wrap(~ variable, scales = "free") +
  labs(title = "Histogram of each power in a single graph")

# iii) Plot the box plot of each power in a single graph
ggplot(melted_avengers_df, aes(x = variable, y = value)) +
  geom_boxplot() +
  labs(title = "Box plot of each power in a single graph",
       x = "Powers", y = "Values")
