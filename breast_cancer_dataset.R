#import dataset
library(readxl)
breast_cancer_dataset <- read_excel("~/Documents/breast_cancer_dataset.xls")
View(breast_cancer_dataset)

filter_grade_2 <-filter(breast_cancer_dataset, grade == 2)
View(filter_grade_2)

filter_node_more7 <-filter(filter_grade_2, nodes > 7)
View(filter_node_more7)


filter_grade2_node7 <- filter(breast_cancer_dataset, nodes > 7 & grade == 2)
View(filter_grade2_node7)

delete_2<- filter_grade2_node7[-c(2), ]
View(delete_2)

delete_column2<- filter_grade2_node7[, -c(2)]
View(delete_column2)

#analysis
BiocManager::install("ggplot2")
library(ggplot2)

cancer_age <- ggplot(data=breast_cancer_dataset, aes(x=age, y=status))+            
  geom_bar(stat="identity")

cancer_age

cancer_age <- ggplot(data=breast_cancer_dataset, aes(x=age, y=status))+            
  geom_bar(stat="identity", fill = "blue") 

cancer_age

#only status == 1
filter_status_1 <-filter(breast_cancer_dataset, status == 1)

#rename column of status == 1
colnames(filter_status_1)[colnames(filter_status_1) == 'status'] <- 'positive'
View(filter_status_1)

cancer_age <- ggplot(data=filter_status_1, aes(x=age, y=positive))+            
  geom_bar(stat="identity", fill = "blue") 

cancer_age

use_git()
