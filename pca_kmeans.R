#PCA - Kmeans clustering
colonc.pca = prcomp(t(filter2),cor=F)
colonc.set = colonc.pca$x[,1:2]
colonc.class = kmeans(colonc.set,centers=2,iter.max=100)
colnames = colnames(filter2)
plot(colonc.set,main = "Kmeans clustering",type='n')
colonc.label = c(rep("C",16),rep("N",16))
#rep() function
plot(colonc.set,type='n',main = "Kmeans clustering")
text(colonc.set,as.character(colonc.label),col=colonc.class$cluster)
text(colonc.set,label=c(1:16,18:27,29:34),pos=2,col=colonc.class$cluster)
legend(0, -2, c("Normal","Cancer"),lty=c(1,1),lwd=c(2.5,2.5),col=c("red","black"))

#or 

colonc.pca = prcomp(t(filter2),cor=F)
colonc.set = colonc.pca$x[,1:2]
colonc.class = kmeans(colonc.set,centers=2,iter.max=100)$cluster
colnames = colnames(filter2)
plot(range(colonc.set[,1]),range(colonc.set[,2]),type="n",xlab="PC1",ylab="PC2",main="First two componets of PCA with Kmeans classification")
colonc.label = c(rep("C",16),rep("N",16))
text(colonc.set,as.character(colonc.label),col=colonc.class)
text(colonc.set,label=c(1:16,18:27,29:34),pos=2,col=colonc.class)
legend(0, -2, c("Normal","Cancer"),lty=c(1,1),lwd=c(2.5,2.5),col=c("red","black"))
