#Simple Linear Regression

#Importing Dataset
dataset=read.csv("fire_and_theft_in_chicago.csv")

#Spliting data into trainig and testing 
library("caTools")
set.seed(123)
split=sample.split(dataset$y,SplitRatio = 0.8)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

#Fitting Simple Linear Regression to the Training set
regressor=lm(formula = y~x,data = training_set)
#summary(regressor)

#Predicting the test set
y_pred =predict(regressor,newdata = test_set)

#visualizing the Training DAta
install.packages("ggplot2")
library("ggplot2")
ggplot()+
  geom_point(aes(x=training_set$x,y=training_set$y),colour="red")+
  goem_line(aes(x=training_set$x,y=predict(regressor,newdata = training_set)),colour="blue")+
  ggtitle('Fire vs theft in chicago(Training set)')+
  xlab('Fires(per 1000 housing units)')+
  ylab('Thefts(per 1000 population)')