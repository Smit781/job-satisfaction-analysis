# Job Satisfaction Analysis (Canada)

This project explores job satisfaction trends across Canadian provinces based on gender, using official statistical data from Statistics Canada.

## 📊 Data Source
- **Source:** [Statistics Canada Table 45-10-0088-01](https://www150.statcan.gc.ca/t1/tbl1/en/cv.action?pid=4510008801)
- The dataset provides satisfaction ratings (Satisfied, Neutral, Dissatisfied) for both men and women across all provinces in Canada.

## 🧹 Data Cleaning
The original dataset was downloaded from StatsCan and cleaned in Excel:
- Removed missing or invalid values
- Standardized column names
- Converted numeric values to proper percentages
- Saved as `Cleaned_Job_Satisfaction_Data.csv` for analysis in R

## 📈 Analysis & Visualization
The analysis was done in R and includes:
- Summary statistics (mean, standard deviation)
- Histograms for gender-based satisfaction
- Pie chart for overall satisfaction breakdown
- Bar plots showing satisfaction/dissatisfaction by province
- Stacked gender comparison bar chart
- Dot charts for gender-wise dissatisfaction

All analysis can be found in `job_satisfaction_analysis.R`.


## 📦 R Libraries Used
- `readr`
- `dplyr`
- `ggplot2` *(optional enhancement)*
- Base R for plotting

## ▶️ How to Run
Open the R script in RStudio or any R environment and run it after loading the dataset. Make sure all required packages are installed:

```r
install.packages(c("readr", "dplyr", "ggplot2"))

