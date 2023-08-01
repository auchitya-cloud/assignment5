# Question 2: 
# Dimensions for the dataset:
num_students <- 100
num_subjects <- 30

# Random Dataset Generation with values between 0 and 200 (representing students' grades)
hogwarts_dataset <- matrix(runif(num_students * num_subjects, min = 0, max = 1), nrow = num_students, ncol = num_subjects)
hogwarts_dataset <- 1 + round(hogwarts_dataset * 199)

# First few rows of the dataset:
print(head(hogwarts_dataset))

# a) Replacing values within the range [10, 60] with NA (Not Available)
hogwarts_dataset[hogwarts_dataset >= 10 & hogwarts_dataset <= 60] <- NA

# Printing the number of students having missing values
num_students_with_missing_values <- sum(apply(hogwarts_dataset, 1, function(row) any(is.na(row))))
print(num_students_with_missing_values)

# b) Replacing NA values with subject averages
subject_averages <- colMeans(hogwarts_dataset, na.rm = TRUE)
hogwarts_dataset[is.na(hogwarts_dataset)] <- subject_averages[rep(seq_len(ncol(hogwarts_dataset)), each = nrow(hogwarts_dataset))]

# c) Calculating the "Pensieve" correlation among all subjects
pensieve_correlation <- cor(hogwarts_dataset, use = "pairwise.complete.obs")

# Plotting the heatmap of the Pensieve correlation matrix
library(ggplot2)
library(reshape2)

melted_pensieve_correlation <- melt(pensieve_correlation)
ggplot(data = melted_pensieve_correlation, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "blue", high = "red") +
  theme_minimal() +
  labs(title = "Pensieve Correlation Heatmap", x = "Subjects", y = "Subjects")

# Selecting the subjects having correlation <= 0.7
selected_subjects <- colnames(pensieve_correlation)[apply(pensieve_correlation <= 0.7, 2, all)]
print(selected_subjects)

# d) Normalizing the dataset between 0 and 10 (representing students' grades on a scale from 0 to 10)
new_min_grade <- 0
new_max_grade <- 10

min_grade <- min(hogwarts_dataset, na.rm = TRUE)
max_grade <- max(hogwarts_dataset, na.rm = TRUE)

normalized_grades <- ((hogwarts_dataset - min_grade) / (max_grade - min_grade)) * (new_max_grade - new_min_grade) + new_min_grade
print(normalized_grades)

# e) Replacing
