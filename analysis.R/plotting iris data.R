# Installation of packages
#renv::install(c('tidyverse', 'ggpubr'))

# Plots of data
library(tidyverse)
library(ggpubr)

head(iris)
ggplot(iris,aes(x=Sepal.Length, y= Sepal.Width))+
  geom_point()+
  geom_smooth()

# Per group
ggplot(iris,aes(x=Sepal.Length, y= Sepal.Width,
                color = Species))+
  geom_point()+
  geom_smooth()
