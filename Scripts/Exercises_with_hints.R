# You will need to load the required libraries first: tidyverse and here.
library(tidyverse)
library(here)

# We will be using traumatic brain injury data from a Tidy Tuesday challenge
# Learn more about the challenge and the data here (spend max 3 minutes looking at the linked page): 
# https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-03-24/readme.md

# Let's start by loading in the data
tbi_age <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-24/tbi_age.csv')
tbi_year <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-24/tbi_year.csv')

### Task 1
# Save both datasets in the Raw_Data folder (use the 'here' library, as I showed in the demo)

# Insert your code for Task 1 below this line:
# Hint: you'll need to use the write_csv function, with syntax from the demo.

### Task 2
# We'll look at tbi_age first. Use your favourite functions for eyeballing data and write a couple of sentences about 
# this dataset (its dimensions, the variables inside, types of data, etc.)

# Insert your code below this line:
# Hint: Which eyeballing functions do you remember from Week 6 videos?
# One example is head()

# Your description of the dataset
# Hint: Write about the number of rows and columns.
# What is each variable saved as? Try str() to help you.

# Task 3
# Are there any variables in this dataset that should be treated as factors? 
# Decide which ones, and turn them into factors. 
# Once you've done that, think about the order of factor levels. Does it need to be changed? If so, change it.

# Insert your code below this line:
# Hint: Categorical variables are usually stored as factors.
# The factor() function will change strings into factors for you.

# Task 4
# Imagine that you are preparing a brief for the local health authority, and they have asked you to 
# answer the following questions. For each question, write a chunk of code that would provide the 
# answer in a clean and reproducible way. 

# Task 4.1
# Which injury mechanism caused the most deaths in total?

# Insert your code below this line:
# Hint: start by filtering the dataset to only include the type of outcome
# and age group you need. This will result in a tibble. 
# Then, arrange the tibble in order that eases interpretation. 

# Task 4.2
# Looking just at the totals, what is the number of ED visits, hospitalisations and deaths
# associated with each injury mechanism? Present the results as a tibble. Save this tibble in your 
# Tables folder. 

# Insert your code below this line:
# Hint: start by filtering the dataset to only include the
# age group you need. This will result in a tibble. 
# Save this tibble using the write_csv function.


# Task 4.3
# Focusing on the oldest age group (75+), draw a bar chart illustrating the number of hospitalisations
# associated with each injury mechanism. Make sure that you add a title and appropriate axis labels.
# Save this chart in your Plots folder.

# Insert your code below this line:
# Hint: Start by filtering the dataset to only include the age group
# and outcome type you need. Then, use ggplot to make your plot.
# Both geom_bar and geom_col will work here, but geom_col might be easier
# to start with.

### Let's now look at tbi_year dataset.
### This is a good time to swap your pair programming roles.

### Task 5
# Use functions for eyeballing data and write a couple of sentences about 
# tbi_year dataset (its dimensions, the variables inside, types of data, etc.)

# Insert your code below this line:
# Hint: see hints above. 

# Your description of the dataset: 

# Task 6
# Are there any variables in this dataset that should be treated as factors? 
# Decide which ones, and turn them into factors. 
# Once you've done that, think about the order of factor levels. Does it need to be changed?

# Insert your code below this line:
# Hint: see hints above.

# Task 7 intro
# Imagine that you are preparing a brief for the local health authority, and they have asked you to 
# answer the following questions. For each question, write a chunk of code that would provide the 
# answer in a clean and reproducible way. 

# Task 7.1
# Plot a line chart that depicts the rate of deaths, per 100000 population, 
# from traumatic brain injury in years 2006-2014.
# Save this chart in your Plots folder. 

# Insert your code below this line:
# Hint: Start by filtering the dataset to only include the outcome type
# and injury mechanism you need. Then, use ggplot geom_line.

# Task 7.2
# Go to this URL: https://www.cdc.gov/traumaticbraininjury/pdf/TBI-Surveillance-Report-FINAL_508.pdf
# On page 14 of the report (page 15 of the pdf document), you'll find Figure 2A,
# showing the rates, per 100000 population, of TBI-related ED visits, by year, 
# and mechanism of injury, 2006-2014.
# Try and re-create this figure.
# First, focus just on depicting the data (you can use the default settings of ggplot).
# If you still have time, try reproducing this figure as closely as possible (colours, style, etc.).
# Save the final version of your figure in your Plots folder.

# Insert your code below this line:
# Hint: Start by filtering the dataset to only include the outcome type you need.
# Check the report to see if Total injuries were plotted?
# Use geom_line and geom_point together to accentuate the data points. 