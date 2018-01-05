##calculate Max value
# colMax <- function(data)sapply(data, max, na.rm = TRUE)
# colMax(pwch2output)
pwch2output <- pwcoutdf[,4,1:Nsims]#in kg/m3
#plot(pwch2output)
#pwch2output <- (pwcoutdf[,4,1:Nsims]*1000000)#concentration in ppb
max_h20<-apply(pwch2output, 2, function(x) max(x, na.rm = TRUE))
#plot(max_h20)
#write.csv(pwch2output, file = paste(pwcdir, "io/pwch2output.csv", sep = ""))
#Calculate PCC in H2o


#extract benthic concentration
pwcbenutput <- pwcoutdf[,3,1:Nsims]
#pwcbenutput <- (pwcoutdf[,3,1:Nsims]*1000000)#1depth, 2Ave.Conc.H20, 3Ave.Conc.benth, 4Peak.Conc.H20
##calculate Maxbenthic concentration
max_ben<-apply(pwcbenutput, 2, function(x) max(x, na.rm = TRUE))

# which(is.na(as.numeric(as.character(max_ben[[1]]))))
# is.infinite(max_ben)
inputdf <- cbind(inputdf, max_h20)
inputdf <- cbind(inputdf, max_ben)
write.csv(inputdf, file = paste(pwcdir, "io/inputdata_przm_vvwm_max.csv", sep = ""))
#convert all NAN,infinite number to NA
max_ben[which(is.nan(max_ben))] = NA
max_ben[which(is.infinite(max_ben))] = NA

#Locating index of rows in a data frame that have the value of NA
which(is.na(max_ben), arr.ind=TRUE)
################PCC with Max
max_ben<- na.omit(max_ben)
#max_indata <- read.csv(file = paste(pwcdir, "io/inputdata_przm_vvwm_max.csv", sep = ""), header = TRUE)


max_h2opcc<- pcc(inputdata, max_h20, rank = F)
max_benpcc<- pcc(inputdata[-c(26,97), ], max_ben, rank = F)


