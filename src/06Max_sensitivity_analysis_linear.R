#devtools::install_github('cran/ggplot2')
##calculate Max value
# colMax <- function(data)sapply(data, max, na.rm = TRUE)
# colMax(pwch2output)

przmh2output <- (outputdf[,4,1:Nsims])
przmmax_h20<-apply(przmh2output, 2, function(x) max(x, na.rm = TRUE))
pwch2output <- (pwcoutdf[,2,1:Nsims]*1000000)#in ug/ml



#colnames(pwcoutdf) 
#write.csv(pwch2output, file = paste(pwcdir, "io/pwch2output.csv", sep = ""))
#plot(pwch2output)
#pwch2output <- (pwcoutdf[,4,1:Nsims]*1000000)#concentration in ppb
max_h20<-apply(pwch2output, 2, function(x) max(x, na.rm = TRUE))
#plot(max_h20)
#write.csv(pwch2output, file = paste(pwcdir, "io/pwch2output.csv", sep = ""))
#Calculate PCC in H2o
#plot(pwch2output)

#extract benthic concentration
pwcbenutput <- (pwcoutdf[,3,1:Nsims]*1000000)
#pwcbenutput <- (pwcoutdf[,3,1:Nsims]*1000000)#1depth, 2Ave.Conc.H20, 3Ave.Conc.benth, 4Peak.Conc.H20
##calculate Maxbenthic concentration
max_ben<-apply(pwcbenutput, 2, function(x) max(x, na.rm = TRUE))
########finding sediment pcc####################
max_sed=output*max_ben
max_sedd=as.numeric(unlist(max_sed))
typeof(max_sed)
# which(is.na(as.numeric(as.character(max_ben[[1]]))))
# is.infinite(max_ben)

inputdf <- cbind(inputdata, przmmax_h20)
inputdf <- cbind(inputdata, max_h20)
#View(inputdf)
inputdf <- cbind(inputdf, max_ben)
inputdf <- cbind(inputdf, output)
inputdf <- cbind(inputdf, max_sedd)
write.csv(inputdf, file = paste(pwcdir, "io/inputdata_przm_vvwm_max.csv", sep = ""))

library(ppcor)

# max_h2opcc<- 
dim(inputdata)
for(i in 1:54){
  var <- colnames(inputdata)[i]
  pcc_value <- pcor(cbind(inputdata[,i],max_h20), method="pearson")$estimate[1,2]
  print(paste(var, pcc_value, min(inputdata[,i]), max(inputdata[,i])))
}

pcor(inputdf,method="pearson")
#, rank = TRUE,nboot = 0, conf = 0.95)
przmmax_h2opcc<- pcc(inputdata, przmmax_h20, rank = F)
max_h2opcc<- pcc(inputdata, max_h20, rank = F)
max_benpcc<- pcc(inputdata, max_ben, rank = F)
max_sedpcc<- pcc(inputdata, max_sedd, rank = F)
plot(przmmax_h2opcc, ylim = c(-1,1))
plot(max_h2opcc, ylim = c(-1,1))

plot(max_benpcc, ylim = c(-1,1))
plot(max_sedpcc, ylim = c(-1,1))

