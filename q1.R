# Number of random strings to be created:
num_random_strings <- 1000
random_strings <- randomStrings(n = num_random_strings, len = 10) # Generating random strings of length 10

# File that will contain the random strings:
output_file <- "random_strings.txt"

# Writing the random strings to the file
writeLines(random_strings, con = output_file)
