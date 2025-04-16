# Load required libraries
library(readr)
library(dplyr)
library(ggplot2)
library(tidyr)

# Read the dataset
data = as.data.frame(Cleaned_Job_Satisfaction_Data)
head(data)

# Summary statistics for all columns
summary(Cleaned_Job_Satisfaction_Data)

# Average satisfaction for men and women
# Mean for Men
mean(Cleaned_Job_Satisfaction_Data$Men_Satisfied)
# Mean for Women
mean(Cleaned_Job_Satisfaction_Data$Women_Satisfied)   

# Standard deviation
# Standard deviation for Men
sd(Cleaned_Job_Satisfaction_Data$Men_Satisfied)
# Standard deviation for Women 
sd(Cleaned_Job_Satisfaction_Data$Women_Satisfied)   

#Visualization : Base R Plots
#Bar Plot – Total Satisfaction by Province
barplot(Cleaned_Job_Satisfaction_Data$Total_Satisfied,
        names.arg =Cleaned_Job_Satisfaction_Data$Geography,
        las = 2,                 # Rotate x-axis labels
        cex.names = 0.8,
        col = "lightblue",
        main = "Total Satisfaction by Province",
        ylab = "Satisfaction (%)")

# Line Plot – Men vs. Women Satisfaction (Enhanced Base R Version)
plot(data$Men_Satisfied, type = "o", col = "blue", pch = 16, lwd = 2,
     ylim = c(60, 90),
     xaxt = "n",
     xlab = "Province", ylab = "Satisfaction (%)",
     main = "Job Satisfaction by Gender")

lines(data$Women_Satisfied, type = "o", col = "red", pch = 16, lwd = 2)

axis(1, at = 1:nrow(data), labels = data$Geography, las = 2, cex.axis = 0.8)

legend("bottomleft", legend = c("Men", "Women"),
       col = c("blue", "red"), lty = 1, pch = 16, bty = "n")

grid(nx = NA, ny = NULL)


#ggplot2 Visualizations
#Bar Plot – Gender Comparison

# Convert wide data to long format for gender comparison
gender_data <- Cleaned_Job_Satisfaction_Data %>%
  select(Geography, Men_Satisfied, Women_Satisfied) %>%
  pivot_longer(cols = c(Men_Satisfied, Women_Satisfied),
               names_to = "Gender", values_to = "Satisfaction")

# Create the bar plot
ggplot(gender_data, aes(x = Geography, y = Satisfaction, fill = Gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Satisfaction by Gender Across Provinces",
       x = "Province", y = "Satisfaction (%)") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


#Box Plot – Gender Satisfaction Distribution

ggplot(gender_data, aes(x = Gender, y = Satisfaction, fill = Gender)) +
  geom_boxplot() +
  labs(title = "Distribution of Satisfaction by Gender",
       y = "Satisfaction (%)")

ggplot(gender_data, aes(x = Geography, y = Satisfaction, fill = Gender)) +
  geom_bar(stat = "identity", position = "dodge")

gender_matrix <- t(as.matrix(data[, c("Men_Satisfied", "Women_Satisfied")]))
barplot(gender_matrix, names.arg = data$Geography, col = c("skyblue", "pink"), beside = FALSE)

ggplot(gender_data, aes(x = Gender, y = Satisfaction, color = Gender)) +
  geom_jitter(width = 0.2) +
  labs(title = "Jittered View of Satisfaction Scores")

total_matrix <- t(as.matrix(data[, c("Total_Satisfied", "Total_Neutral", "Total_Dissatisfied")]))
barplot(total_matrix, names.arg = data$Geography,
        col = c("green", "yellow", "red"), legend = TRUE, las = 2,
        main = "Total Satisfaction Composition")


=====================
  
  # Visualizing men's satisfaction levels using a histogram
  hist(data$Men_Satisfied,
       col = "skyblue",               # Fill color of the bars
       main = "Men’s Job Satisfaction",  # Chart title
       xlab = "Satisfaction (%)",     # Label for X-axis
       border = "white")              # Border color around bars


# Visualizing women's satisfaction levels using a histogram
hist(data$Women_Satisfied,
     col = "pink",                  # Fill color for bars
     main = "Women’s Job Satisfaction", # Title of the histogram
     xlab = "Satisfaction (%)",     # X-axis label
     border = "white")              # Bar border color

# Calculate total counts for each satisfaction category
satisfaction_totals <- colSums(data[, c("Total_Satisfied", "Total_Neutral", "Total_Dissatisfied")])

# Define category names for the pie chart
category_labels <- c("Satisfied", "Neutral", "Dissatisfied")

# Generate the pie chart to show satisfaction distribution
pie(satisfaction_totals,
    labels = category_labels,
    col = c("green", "yellow", "red"),
    main = "Overall Satisfaction Breakdown")

# Draw a bar chart showing total satisfaction percentage per province
barplot(height = data$Total_Satisfied,
        names.arg = data$Geography,
        col = "skyblue",                    # Bar fill color
        las = 2,                            # Rotate x-axis labels vertically
        main = "Total Satisfaction by Province",
        ylab = "Satisfaction (%)",
        cex.names = 0.8,                    # Resize x-axis text if overlapping
        cex.axis = 0.9,                     # Resize axis numbers
        cex.main = 1.2)                     # Resize main title
# Visualize the dissatisfaction percentage across provinces using a bar chart
barplot(height = data$Total_Dissatisfied,
        names.arg = data$Geography,
        col = "tomato",                   # Red tone for dissatisfaction
        las = 2,                          # Rotate province labels vertically
        main = "Dissatisfaction by Province",
        ylab = "Dissatisfaction (%)",
        cex.names = 0.7,                  # Resize x-axis labels
        cex.axis = 0.9,                   # Resize y-axis text
        cex.main = 1.2)                   # Resize chart title

