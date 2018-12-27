#Multiple Linear Regression

#Importing Dataset
dataset=read.csv("50_startups.csv")

#Encoding Categorical Data
dataset$State=factor(dataset$State,levels = c('New York','California'),labels = c(1,2))

#Spliting data into trainig and testing
library("caTools")
set.seed(123)
split=sample.split(dataset$Profit,SplitRatio = 0.8)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

#Creating Regressor for Multiple Linear Regression for Training
regressor=lm(formula = Profit~R.D.Spend+Administration+Marketing.Spend+State,data = training_set)
summary(regressor)

#Predicting the test_data
y_pred = predict(regressor,newdata = test_set)

#Backword Elimination To Optimize the Model
regressor=lm(formula = Profit~R.D.Spend+Administration+Marketing.Spend+State,data = training_set)
summary(regressor)
regressor=lm(formula = Profit~R.D.Spend+Administration+Marketing.Spend,data = training_set)
summary(regressor)
regressor=lm(formula = Profit~R.D.Spend+Marketing.Spend,data = training_set)
summary(regressor)
regressor=lm(formula = Profit~R.D.Spend,data = training_set)
summary(regressor)
regressor=lm(formula = Profit~R.D.Spend = training_set)
summary(regressor)