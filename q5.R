# Question 4: 

# Loading required libraries
library(ggplot2)

# Setting the seed for a wild party!
set.seed(42)

# Creating a random dataset with values between -100 and 100
num_guests <- 600
num_rooms <- 15
party_dataset <- matrix(runif(num_guests * num_rooms, min = -100, max = 100), nrow = num_guests, ncol = num_rooms)

# Converting the matrix to a data frame
party_df <- as.data.frame(party_dataset)

# i) Plot Scatter graph between Room 5 and Room 6
ggplot(party_df, aes(x = V5, y = V6)) +
  geom_point() +
  labs(title = "Scatter plot between Room 5 and Room 6",
       x = "Room 5", y = "Room 6")

# ii) Plot histogram of each room in a single graph
melted_party_df <- reshape2::melt(party_df)
ggplot(melted_party_df, aes(x = value)) +
  geom_histogram(binwidth = 5) +
  facet_wrap(~ variable, scales = "free") +
