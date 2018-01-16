#training and prediction
library(MASS)
filter3 <- filter2
colnames(filter3) <- c("c","c","c","c","c","c","c","c","c","c","c","c","c","c","c","c","n","n","n","n","n","n","n","n","n","n","n","n","n","n","n","n")

colonc.label2 = colnames(filter3)
colonc.label2 = factor(colonc.label2)
colonc.frame = as.data.frame(colonc.label2,t(filter3))
colonc.trainset = colonc.frame[c(1:12, 17:28),]
colonc.testset = colonc.frame[c(13:16, 29:32),]
colonc.name = colonc.testset[,1]
colonc.testset1 = colonc.testset[,-1]
colonc.trainlda = lda(colonc.label2~.,data=colonc.trainset)
colonc.testlda = predict(colonc.trainlda,colonc.testset[1:8,])
table(colonc.testlda$class,colonc.name)
colonc.testlda$x

plot(colonc.testlda$x, pch=17,col=colonc.name,main = "Discriminant analysis of colon cancer data", xlab="Samples", ylab = "LD1")
legend(5,0,c("Cancer","Normal"),lty=c(1,1), lwd=c(2.5,2.5),col=c("black","red"))
