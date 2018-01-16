#DATA
source("http://www.bioconductor.org/biocLite.R")
biocLite("GEOquery")

library(Biobase)
library(GEOquery)

#get data
gds4382 <- getGEO('GDS4382', destdir=".")
#view attributes
Meta(gds4382)$channel_count
Meta(gds4382)$description
Meta(gds4382)$feature_count
Meta(gds4382)$platform
Meta(gds4382)$sample_count
Meta(gds4382)$sample_organism
Meta(gds4382)$sample_type
Meta(gds4382)$title
Meta(gds4382)$type

#check column names
colnames(Table(gds4382))
Table(gds4382)[1:10,1:6]

#extract dataset
ma <- GDS2MA(gds4382,do.log2=FALSE)
eset <- GDS2eSet(gds4382, do.log2=TRUE)
eset
featureNames(eset)[1:10]
sampleNames(eset)

#study more about dataset
pData(eset)$sample
pData(eset)$tissue
pData(eset)$individual
pData(eset)$description


eset[1:2, 1:2]
exprs(eset[1:2,1:2])

Meta(gds4382)$platform
gpl570 <- getGEO('GPL570', destdir=".")

Meta(gpl570)$title
colnames(Table(gpl570))
Table(gpl570)[1:10,1:4]

Table(gpl570)[1:10,c("ID","GB_LIST","Gene.Title","Gene.Symbol","Entrez.Gene")]

#------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------
#EXTRACT DATA

colon = exprs(eset)
colon = as.data.frame(colon)
dim(colon)
dimnames(colon)[[2]]
colonc <- colon
colnames(colonc) <- c(1:34)
dimnames(colonc)[[2]]
 
#------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------


