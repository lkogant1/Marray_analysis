#discrimant analysis
dim(filter2)
cancer = apply(filter2[,1:16],1,mean,na.rm=T)
normal = apply(filter2[,17:32],1,mean,na.rm=T)
fold = cancer - normal
fold2 = sort(fold)
discriminant.g = names(fold2[c(1:5,3786:3790)])
discriminant.g
