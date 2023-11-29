# Installation of packages
#renv::install(c('tidyverse', 'ggpubr'))

# Call packages
library(tidyverse)
library(ggpubr)

# Snapshot with renv
#renv::snapshot()

# Loading and exploring iris data
data(iris) 
head(iris)
summary(iris)
str(iris)

ggplot(iris,aes(x=Sepal.Length, y= Sepal.Width))+
  geom_point()+
  geom_smooth()

# Per group
ggplot(iris,aes(x=Sepal.Length, y= Sepal.Width, color = Species))+
  geom_point()+
  geom_smooth()

