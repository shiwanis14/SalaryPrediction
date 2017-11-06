#Simple linear regression

dataset=read.csv('Salary_Data.csv')



#splitting the data set into training and test sets
#install.packages('caTools')
library(caTools)
set.seed(123)
split=sample.split(dataset$Salary, SplitRatio = 2/3)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

#fitting SLR to the training set

regressor= lm(formula=Salary ~ YearsExperience, data = training_set)

#predicting test results
 y_pred=predict(regressor,newdata=test_set)
 
 #visualising install.packages('ggplot2')

library(ggplot2)
 
ggplot()+
  geom_point(aes(x= training_set$YearsExperience, training_set$Salary), 
             colour= 'red')+
  geom_line(aes(x= training_set$YearsExperience,y= predict(regressor,newdata=training_set)),
            colour='blue') +
  ggtitle('salary vs exp') +
  xlab('years of experience') +
  ylab('salary')

ggplot()+
  geom_point(aes(x= test_set$YearsExperience, test_set$Salary), 
             colour= 'red')+
  geom_line(aes(x= training_set$YearsExperience,y= predict(regressor,newdata=training_set)),
            colour='blue') +
  ggtitle('salary vs exp') +
  xlab('years of experience') +
  ylab('salary') 