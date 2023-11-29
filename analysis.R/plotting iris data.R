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
summary_iris

# Filter and arrange data
filtered_iris <- iris %>% 
  filter(Species != "setosa") %>%   # remove Species = setosa 
  filter(Sepal.Length > mean(Sepal.Length)- 1*sd(Sepal.Length) & Sepal.Length < mean(Sepal.Length) + 1*sd(Sepal.Length)) %>%
                                   # Only take sepal.length that is between mean plus/minus 1 SD
  arrange(desc(Sepal.Length))      # Arrange data according to Sepal.length - high to low
filtered_iris


### Data Visualization with ggplot ----
# 'ggplot2' and 'ggpubr' are called previous 

# Density plot of Filtered data
ggdensity(filtered_iris, x="Sepal.Length",
          add = "mean", 
          color = "Species", fill = "Species",
          palette = c("pink", "orange"))

# Bar plot of Filtered data - with comparisons
ggbarplot(filtered_iris,
          x="Species", y="Petal.Length", 
          add = "mean_se",
          color = "Species", fill = "Species",
          palette = c("pink", "orange"))+
  stat_compare_means(method = "t.test")

# Boxplot of of Filtered data
filtered_iris_boxplot <- ggboxplot(filtered_iris, x = "Species", y="Sepal.Length",
          color = "Species", palette = c("pink", "orange"),
          add = "jitter", 
          shape = "Species")
filtered_iris_boxplot

# .. with comparisons
filtered_iris_boxplot+stat_compare_means(method = "t.test")

# Boxplot of of full iris data
iris_boxplot <- ggboxplot(iris, x = "Species", y="Sepal.Length",
                          color = "Species", palette = c("pink", "orange", "green"),# One more color is added to include Species = setosa
                          add = "jitter", 
                          shape = "Species")

# .. with comparisons
# anova
iris_boxplot + stat_compare_means(method = "anova")
# pairwise comparisons
my_comparisons <- list(c(1,2), # correspond to: c("versicolor", "setosa")
                       c(2,3), # correspond to: c("verisicolor", "virginica")
                       c(1,3)) # correspond to: ("setosa", "virginica")


iris_boxplot + stat_compare_means(comparisons = my_comparisons)+ # p values of pairwise comparisons 
  stat_compare_means(label.y = 10) # add anova






