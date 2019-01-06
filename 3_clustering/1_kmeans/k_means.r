#K-Means Clustering

#import iris dataset
dataset<-read.csv("iris.csv")
x<-dataset[c(1,3)]

#finding optimal minimum number of clustors
set.seed(0)
wcss<- vector()
for(i in 1:10)wcss[i]<-sum(kmeans(x,i)$withinss)
plot(1:10,wcss,type = "b",main = paste('Cluster of iris'),xlab = "Number of Clusters",ylab = "WCSS")

#applying k-means to iris data
set.seed(0)
kmeans<-kmeans(x,3,iter.max = 300,nstart = 10)

#visualization
# install.packages('cluster')
library(cluster)
clusplot(x,
  kmeans$cluster,
  lines=0,
  shade=TRUE,
  color=TRUE,
  labels= 2,
  plotchar=FALSE,
  span=TRUE,
  main=paste('Custor of iris'),
  xlab="Sepal Length(cm)",
  ylab="Petal Length(cm)")