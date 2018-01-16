#CV vs Mean Plot
mean.colonc<-apply(colonc,2,mean)
var.colonc<-sqrt(apply(colonc,2,var))
cv.colonc<-var.colonc/mean.colon
plot(mean.colonc,cv.colonc, type="n",main="Sample CV vs Mean Plot",xlab="Mean",ylab="CV",pch = 15, col="blue",cex=0.5)
points(mean.colonc,cv.colonc,bg="lightblue",col=1,pch=21)
text(mean.colonc,cv.colonc, labels=names(colonc),pos=1,cex=0.5)
#------------------------------------------------------------------------
#Cluster Dendogram
tcolonc<-t(colonc)
dist.tcolonc<-dist(tcolonc,method="euclidean")
clust.colonc<-hclust(dist.tcolonc,method="single")
plot(clust.colonc,labels=names(colonc),cex=0.75,main="Cluster Dendogram")
#------------------------------------------------------------------------
#AVG correlation plot
colonc.cor = cor(colonc)
colonc.avg <- apply(colonc.cor,1,mean)
par(oma=c(3,0.1,0.1,0.1))
plot(c(1,length(colonc.avg)),range(colonc.avg),type="n", xlab ="",ylab="Avg r",main="Avg correlation of Tumor/Normal samples",axes=F)
points(colonc.avg,bg="red",col=1,pch=21,cex=1.25)
axis(1,at=c(1:length(colonc.avg)),labels=dimnames(colonc)[[2]],las=2,cex.lab=0.4,cex.axis=0.6)
axis(2)
abline(v=seq(0.5,62.5,1),col="grey")

#------------------------------------------------------------------------
#correlation plot
library(gplots)
colonc.cor = cor(use ='pairwise.complete.obs', colonc, method = 'pearson')
 layout(matrix(c(1,1,1,1,1,1,1,1,2,2), 5, 2, byrow = T))
 par(oma=c(5,7,1,1))
 cx = rev(colorpanel(25,'yellow','black','blue'))
 leg = seq(min(colonc.cor,na.rm=T),max(colonc.cor,na.rm=T),length=10)
 image(colonc.cor,main='Correlation matrix',axes=F,col=cx)
 title(xlab='Arrays', ylab='Arrays')
 axis(1,at=seq(0,1,length=ncol(colonc.cor)),label=dimnames(colonc)[[2]],cex.axis=0.9,las=2)
 axis(2,at=seq(0,1,length=ncol(colonc.cor)),label=dimnames(colonc)[[2]],cex.axis=0.9,las=2)

#legend
layout(matrix(c(1,1,1,1,1,1,1,1,2,2), 5, 2, byrow = TRUE))
par(oma=c(5,7,1,1))
cx = rev(colorpanel(25,'yellow','black','blue'))
leg = seq(min(colonc.cor,na.rm=T),max(colonc.cor,na.rm=T),length=10)
image(as.matrix(leg),col=cx,axes=F)
tmp = round(leg,2)
axis(1,at=seq(0,1,length=length(leg)),labels=tmp,cex.axis=1)
#------------------------------------------------------------------------
#Removing outliers
colonc <- colon
colnames(colonc) <- c(1:34)
colonc <- colonc[,-28]
dimnames(colonc)[[2]]
dim(colonc)

colonc <- colonc[,-17]
dimnames(colonc)[[2]]
dim(colonc)
#------------------------------------------------------------------------