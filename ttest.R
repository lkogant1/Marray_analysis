#ttest on all genes
t.test.all.genes <- function(x,s1,s2) {
  x1<-x[s1]
  x2<-x[s2]
  x1 <- as.numeric(x1)
  x2 <- as.numeric(x2)
t.out<-t.test(x1,x2,alternative="two.sided",var.equal=T)
out <- as.numeric(t.out$p.value)
	return(out)
}
t.test.run <- apply(colonc,1, t.test.all.genes,s1=c(1:16),s2=c(17:32))
hist(t.test.run,col="blue", xlab="P-value",main="Histogram of pvalue of all genes of\n colon cancer dataset")

#------------------------------------------------------------------

#filtering
filter = colonc[rowMeans(colonc)>=mean(rowMeans(colonc)),]
dim(filter)
t.test.all.genes <- function(x,s1,s2) {
  x1<-x[s1]
  x2<-x[s2]
  x1 <- as.numeric(x1)
  x2 <- as.numeric(x2)
t.out<-t.test(x1,x2,alternative="two.sided",var.equal=T)
out <- as.numeric(t.out$p.value)
	return(out)
}
t.test.run2 <- apply(filter,1, t.test.all.genes,s1=c(1:16),s2=c(17:32))

hist(t.test.run2,col="purple", xlab="P-value",main="Histogram of genes with expression values\n greater than Mean expression value")

# ttest.run1 versus ttest.run2
par(mfrow=c(2,1))
hist(t.test.run,col="blue",main="P-values of All genes", xlab="P-value")
hist(ttest.holm,col="purple",main="P-values of specific genes with expression values \n greater than mean expression value \n and P-value < 0.05 (Holm's) ", xlab="P-value")

# ttest on P-value < 0.05 and expression value > Mean expression value
ttest.holm = p.adjust(t.test.run2,method="holm")
hist(ttest.holm,col="green", xlab="P-value",main="Histogram of genes with expression values\n greater than mean expression value and\n P-value <0.05")
filter2 = filter[ttest.holm <= 0.05,]
dim(filter2)

t.test.run3 <- apply(filter2,1, t.test.all.genes,s1=c(1:16),s2=c(17:32))
hist(t.test.run3,col="lightblue", xlab="P-value",main="Histogram of genes with expression values\n greater than mean expression value and\n P-value <0.05")


#------------------------------------------------------------------

