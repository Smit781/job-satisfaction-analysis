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

# Visualizing men's satisfaction levels using a histogram
hist(data$Men_Satisfied,
     col = "skyblue",               
     main = "Men’s Job Satisfaction",  # Chart title
     xlab = "Satisfaction (%)",    
     border = "white",
     lty =2,
     lwd=2,
     cex=2)      


#Histogram
# Visualizing women's satisfaction levels using a histogram
hist(data$Women_Satisfied,
     col = "pink",                  
     main = "Women’s Job Satisfaction", 
     xlab = "Satisfaction (%)",     
     border = "white",
     lty =2,
     lwd=2,
     cex=2)              

#Pie chart

# Calculate total counts for each satisfaction category
satisfaction_totals <- colSums(data[, c("Total_Satisfied", "Total_Neutral", "Total_Dissatisfied")])

# Define category names for the pie chart
category_labels <- c("Satisfied", "Neutral", "Dissatisfied")

# Generate the pie chart to show satisfaction distribution
pie(satisfaction_totals,
    labels = category_labels,
    col = c("green", "yellow", "red"),
    main = "Overall Satisfaction Breakdown",
    lty =1,
    lwd=2)


#Bar Chart
# Draw a bar chart showing total satisfaction percentage per province
barplot(height = data$Total_Satisfied,
        names.arg = data$Geography,
        col = "skyblue",                    
        las = 2,                            # Rotate x-axis labels vertically
        main = "Total Satisfaction by Province",
        ylab = "Satisfaction (%)",
        # Resize x-axis text if overlapping
        cex.names = 0.8,                    
        # Resize axis numbers
        cex.axis = 0.9,                    
        # Resize main title
        cex.main = 1.2)                     

# Visualize the dissatisfaction percentage across provinces using a bar chart
barplot(height = data$Total_Dissatisfied,
        names.arg = data$Geography,
        col = "tomato",                   
        las = 2,                          
        main = "Dissatisfaction by Province",
        ylab = "Dissatisfaction (%)",
        # Resize x-axis labels
        cex.names = 0.7,                 
        # Resize y-axis text
        cex.axis = 0.9,                  
        # Resize chart title
        cex.main = 1.2)                   



# stacked bar chart of male and female satisfaction
# Build a matrix 
gender_matrix <- t(as.matrix(data[, c("Men_Satisfied", "Women_Satisfied")]))

# Plot a stacked bar chart showing satisfaction by gender across provinces
barplot(gender_matrix,
        names.arg = data$Geography,
        col = c("skyblue", "pink"),             
        legend = c("Men", "Women"),              
        main = "Stacked Bar Plot: Male vs Female Satisfaction",
        # Rotate x-axis labels vertically
        las = 2,                                 
        ylab = "Satisfaction (%)",
        # Resize x-axis text
        cex.names = 0.7,                          
        # Resize main title
        cex.main = 1.2)                           


# Dot chart
# Dot chart showing dissatisfaction levels among men, with province names
dotchart(x = data$Men_Dissatisfied,
         labels = data$Geography,
         main = "Men's Dissatisfaction by Province",
         xlab = "Dissatisfaction (%)",
         col = "blue",
         pch = 16)

# Dot chart showing dissatisfaction levels among women, with province names
dotchart(x = data$Women_Dissatisfied,
         labels = data$Geography,
         main = "Women's Dissatisfaction by Province",
         xlab = "Dissatisfaction (%)",
         col = "red",
         pch = 16)


