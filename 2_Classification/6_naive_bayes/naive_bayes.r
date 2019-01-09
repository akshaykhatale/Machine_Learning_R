#Naive Bayes Classifier

#Importing Dataset
dataset=read.csv("iris.csv")
dataset=dataset[,c(1,3,5)]

#catagorize the target variable
dataset$class=factor(dataset$class,levels = c('Iris-setosa','Iris-versicolor','Iris-virginica'),labels = c(1,2,3))

#Spliting data into trainig and testing 
library("caTools")
set.seed(123)
split=sample.split(dataset$class,SplitRatio = 0.80)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

#Feature Scaling
training_set[-3]=scale(training_set[-3])
test_set[-3]=scale(test_set[-3])

#Implementing naive bayes on training data
#install.packages('e1071')
library(e1071)
classifier=naiveBayes(x=training_set[-3],y=training_set$class)

#Predicting the Test on data
y_pred=predict(classifier,newdata = test_set[-3])

#Creating The confusion Metrix
cm=table(test_set[,3] ,y_pred)

#Visualizing the Training Data
#install.packages('ElemStatLearn')
library(ElemStatLearn)
set = training_set
plot(set[, -3],
     main = 'Naive Bayes (Training set)',
     xlab = 'Sepal Length', ylab = 'Petal Length',
     xlim = range(X1), ylim = range(X2))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', ifelse(set[, 3] == 2,'red3','blue')))

#Visualizing the Testing Data
#install.packages('ElemStatLearn')
library(ElemStatLearn)
set = test_set
plot(set[, -3],
     main = 'Naive Bayes (Test set)',
     xlab = 'Sepal Length', ylab = 'Petal Length',
     xlim = range(X1), ylim = range(X2))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', ifelse(set[, 3] == 2,'red3','blue')))
