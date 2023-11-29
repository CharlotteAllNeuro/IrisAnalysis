### # Installation of packages and initiating renv ----
renv::install(c('tidyverse', 'ggpubr'))

# Call packages
library(tidyverse)
library(ggpubr)

# Snapshot with renv
renv::snapshot()

### Loading and exploring iris data ----
data(iris) 
head(iris)
summary(iris)
str(iris)

### Data manipulation ----

# Big graphical overview of Iris
# install.packages("GGally")
library(ggplot2)
library(GGally) # require ggplot
ggpairs(iris, aes(color = Species))

# Find data without NA
iris %>% 
  drop_na() %>% # remove any row with missing data
  unique() %>%  # remove any duplicate row from the data
  summary()

# Summaries data by species
summary_iris <- iris %>% 
  group_by(Species) %>% 
  summarise_all(list("mean" = mean, 
                     "median" = median))
View(summary_iris)

# Filter and arrange data
filtered_iris <- iris %>% 
  filter(Species != "setosa") %>%               # remove setosa 
  filter(Sepal.Length > 5) %>%                  # Only show sepal.length above 5
  filter(Sepal.Width >2 & Petal.Width > 2) %>%  # Only show rows with both sepal and petal width above 2
  arrange(desc(Sepal.Length))                   # Arrange data according to Sepal.length - high to low

filtered_iris






ggplot(iris,aes(x=Sepal.Length, y= Sepal.Width))+
  geom_point()+
  geom_smooth()

# Per group
ggplot(iris,aes(x=Sepal.Length, y= Sepal.Width, color = Species))+
  geom_point()+
  geom_smooth()

