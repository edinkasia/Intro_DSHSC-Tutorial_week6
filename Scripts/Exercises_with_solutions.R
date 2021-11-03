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
# Use a write_csv function, with the here() syntax
# Remember, the folder name goes first, followed by file name
write_csv(tbi_age, file = here("Raw_Data", "tbi_age.csv"))
write_csv(tbi_year, file = here("Raw_Data", "tbi_year.csv"))

### Task 2
# We'll look at tbi_age first. Use your favourite functions for eyeballing data and write a couple of sentences about 
# this dataset (its dimensions, the variables inside, types of data, etc.)

# Insert your code below this line:
head(tbi_age)
str(tbi_age)

# Your description of the dataset
# E.g. This dataset has 231 rows and 5 columns. It includes 5 variables:
# age group, type of outcome, injury mechanism, estimated number of injuries
# in total, and estimated rate per 100000 population. Estimated number and rate
# are numeric, type of outcome and injury mechanism, are categorical nominal
# variables stored as strings, and age is a categorical ordinal variable,
# also stored as a string.

# Task 3
# Are there any variables in this dataset that should be treated as factors? 
# Decide which ones, and turn them into factors. 
# Once you've done that, think about the order of factor levels. Does it need to be changed? If so, change it.

# Insert your code below this line:

# Solution: type, injury_mechanism and age_group are all categorical variables,
# and so should be stored as factors. We can use the mutate() function to
# change those variables, and the factor() function to turn them into factors. 
# No additional arguments are needed.
tbi_age <- tbi_age %>% 
  mutate(type = factor(type),
         injury_mechanism = factor(injury_mechanism),
         age_group = factor(age_group))

# When we used the default settings, the factor levels of age were a little
# mixed up. We're able to sort them using the levels argument.
# Notice how we've got overlapping age_group levels for children - 
# this would cause trouble if we just added different age groups up.
tbi_age <- tbi_age %>% 
  mutate(age_group = factor(age_group, levels = c("0-17", "0-4", "5-14", "15-24",
                                                  "25-34", "35-44", "45-54", "55-64",
                                                  "65-74", "75+", "Total")))

# Task 4
# Imagine that you are preparing a brief for the local health authority, and they have asked you to 
# answer the following questions. For each question, write a chunk of code that would provide the 
# answer in a clean and reproducible way. 

# Task 4.1
# Which injury mechanism caused the most deaths in total?

# Insert your code below this line:

# First, think about subsetting the data - which variables do you need?
# You don't want to look at any particular age group, so you can
# set age_group to be Total. You are interested in deaths,
# so you can set type to be Deaths. Use the filter function,
# with both of these criteria applied:
tbi_age %>% 
  filter(age_group == "Total" & type == "Deaths")

# Using the line above, you already get a pretty small tibble,
# from which you can read out the highest number.
# If you wanted to make your life even easier, you can arrange
# this tibble, with the highest number first:
tbi_age %>% 
  filter(age_group == "Total" & type == "Deaths") %>% 
  arrange(desc(number_est)) 

# This solution is good for eyeballing, as we can see the number of injuries
# in descending order.

# Task 4.2
# Looking just at the totals, what is the number of ED visits, hospitalisations and deaths
# associated with each injury mechanism? Present the results as a tibble. Save this tibble in your 
# Tables folder. 

# Insert your code below this line:
# As before, start by thinking about filtering - you want all types of outcome,
# but you're interested in the Total across age groups. So, you can set 
# age_group to "Total". You will want to save the tibble, so assign it into a new object.
table_age <- tbi_age %>% 
  filter(age_group == "Total")

# If you wanted to, you could add the `arrange` function (like above), 
# just to ease interpretation.
table_age <- tbi_age %>% 
  filter(age_group == "Total") %>% 
  arrange(desc(number_est))
 
# And then, for writing into a file, we use the write_csv function,
# with the here helper, to put it into the required folder.

write_csv(table_age, here("Tables", "table_age.csv"))


# Task 4.3
# Focusing on the oldest age group (75+), draw a bar chart illustrating the number of hospitalisations
# associated with each injury mechanism. Make sure that you add a title and appropriate axis labels.
# Save this chart in your Plots folder.

# Insert your code below this line:

plot1 <- tbi_age %>% 
  filter(age_group == "75+" & type == "Hospitalizations") %>% 
  # the str_wrap function from stringr adds line breaks in our injury_mechanism
  # labels, so they look better in the plot
  mutate(injury_mechanism = str_wrap(injury_mechanism, width = 15)) %>% 
  # reorder will sort the bars by height, so that the injury mechanism
  # with most cases is first
  ggplot(aes(x = reorder(injury_mechanism, desc(-number_est)), y = number_est)) +
  geom_bar(stat = "identity") +  #or use geom_col
  labs(title = "Injuries, by mechanism, in the 75+ age group",
       x = "Injury mechanism", y = "Number of injuries") +
  coord_flip() # this swaps x and y coordinates, making the labels more visible

# Note that the labels are very long, and there are different ways to deal with that:
# https://stackoverflow.com/questions/1330989/rotating-and-spacing-axis-labels-in-ggplot2
  
ggsave(here("Plots", "Injuries_oldest_group.pdf"))
# ggsave saves the most recent plot by default, but you can specify the plot
# with the 'plot' argument
  
### Let's now look at tbi_year dataset.

### Task 5
# Use functions for eyeballing data and write a couple of sentences about 
# tbi_year dataset (its dimensions, the variables inside, types of data, etc.)

# Insert your code below this line:
head(tbi_year)
str(tbi_year)

# Your description of the dataset: 
# E.g. This dataset has 216 rows and 5 columns. It includes 5 variables:
# injury mechanism, type of outcome, year, estimated number of injuries
# in total, and estimated rate per 100000 population. Year, estimated number 
# and rate are numeric, type of outcome and injury mechanism, are categorical 
# nominal variables stored as strings.

# Task 6
# Are there any variables in this dataset that should be treated as factors? 
# Decide which ones, and turn them into factors. 
# Once you've done that, think about the order of factor levels. Does it need to be changed?

# Insert your code below this line:
tbi_year <- tbi_year %>% 
  mutate(injury_mechanism = factor(injury_mechanism),
         type = factor(type))

# We don't need to change the factor levels for any variable. 

# Task 7 intro
# Imagine that you are preparing a brief for the local health authority, and they have asked you to 
# answer the following questions. For each question, write a chunk of code that would provide the 
# answer in a clean and reproducible way. 

# Task 7.1
# Plot a line chart that depicts the rate of deaths, per 100000 population, 
# from traumatic brain injury in years 2006-2014.
# Save this chart in your Plots folder. 

# Insert your code below this line:
plot2 <- tbi_year %>% 
  filter(injury_mechanism == "Total" & type == "Deaths") %>% 
  ggplot(aes(x = year, y = rate_est)) +
  geom_line() + 
  geom_point() + # using two geoms makes the data points more visible
  labs(title = "Rate of deaths, per 100000 population, from traumatic brain injury",
       x = "Year", y = "Estimated rate")

plot2

ggsave(here("Plots", "Total_death_rates.pdf"))

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

plot3 <- tbi_year %>% 
  filter(type == "Emergency Department Visit" & injury_mechanism != "Total") %>% 
  ggplot(aes(x = year, y = rate_est, colour = injury_mechanism)) +
  geom_line() + 
  geom_point() +
  labs(title = "FIGURE 2A: ESTIMATED AGE-ADJUSTED RATES, PER 100,000 POPULATION,OF TRAUMATIC BRAIN INJURY– 
       RELATED EMERGENCY DEPARTMENT VISITS, BY YEAR AND MECHANISM OF INJURY, 2006-2014",
       y = "Age-adjusted rates of TBI-related ED visits") +
  theme_bw() + 
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                     panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "black"),
        legend.position = "bottom",
        legend.title = element_blank())

plot3
ggsave(here("Plots", "TBI_related_ED_visits.pdf"), width=11, height=8.5)
