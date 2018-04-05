#devtools::install_github('cran/ggplot2')
##calculate Max value
# colMax <- function(data)sapply(data, max, na.rm = TRUE)
# colMax(pwch2output)
pwch2output <- pwcoutdf[,2,1:Nsims]#in kg/m3
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
########finding sediment pcc####################
max_sed=output*max_ben*1000000
max_sedd=as.numeric(unlist(max_sed))
typeof(max_sed)
# which(is.na(as.numeric(as.character(max_ben[[1]]))))
# is.infinite(max_ben)
inputdf <- cbind(inputdf, max_h20)
inputdf <- cbind(inputdf, max_ben)
inputdf <- cbind(inputdf, output)
inputdf <- cbind(inputdf, max_sedd)
write.csv(inputdf, file = paste(pwcdir, "io/inputdata_przm_vvwm_max.csv", sep = ""))


max_h2opcc<- pcc(inputdata, max_h20, rank = TRUE,nboot = 0, conf = 0.95)
max_benpcc<- pcc(inputdata, max_ben, rank = F)
max_sedpcc<- pcc(inputdata, max_sedd, rank = F)

plot(max_h2opcc, ylim = c(-1,1))
boxplot(max_h20)

# #convert all NAN,infinite number to NA in max_ben and max_sed
# max_h20[which(is.nan(max_h20))] = NA
# max_h20[which(is.infinite(max_h20))] = NA
# max_ben[which(is.nan(max_ben))] = NA
# max_ben[which(is.infinite(max_ben))] = NA
# max_sedd[which(is.nan(list(max_sedd)))] = NA
# max_sedd[which(is.infinite(max_sedd))] = NA
# #Locating index of rows in a data frame that have the value of NA
# which(is.na(max_ben), arr.ind=TRUE)
# which(is.na(max_sedd), arr.ind=TRUE)
# which(is.na(max_h20), arr.ind=TRUE)
# ################PCC with Max
# max_ben<- na.omit(max_ben)
# #max_indata <- read.csv(file = paste(pwcdir, "io/inputdata_przm_vvwm_max.csv", sep = ""), header = TRUE)
# max_sedd<- na.omit(max_sedd)
# max_h20<- na.omit(max_h20)
# 
# remove_outliers <- function(x, na.rm = TRUE, ...) {
#   qnt <- quantile(max_h20, probs=c(.25, .75), na.rm = na.rm, ...)
#   H <- 1.5 * IQR(max_h20, na.rm = na.rm)
#   y <- max_h20
#   y[max_h20 < (qnt[1] - H)] <- NA
#   y[max_h20 > (qnt[2] + H)] <- NA
#   y
# }
# boxplot(y)
# y<-remove_outliers(max_h20)
# max_h2opcc<- pcc(inputdata, max_h20, rank = F)
# max_h2opcc<- pcc(inputdata, max_h20, rank = F)
# max_h2opcc<- pcc(inputdata[-c(25,49,781,782,1173,1975,2193,4675), ], max_h20, rank = F)
# #max_benpcc<- pcc(inputdata, max_ben, rank = F)
# max_benpcc<- pcc(inputdata[-c(25,49,106,222,430,548,663,760,909,992,1089,1187,1209,1441,1476,1590,1637,1751,1958,2018,2105,2170,2218,2399,2448,2520,2543,2655,2668,2837,2841,3334,3350,3544,3636,3707,3885,4185,4211,4290,4377,4442,4484,4600,4607,4707,4773,4849,4877,4881), ], max_ben, rank = F)
# max_sedpcc<- pcc(inputdata[-c(128,171,290,324,367,385,395,424,678,871,881,932,1093,1140,1163,1251,1265,1624,1731,1851,1908
#                               ,2104,2407,2490,2535,2660,2870,3109,3223,3278,3286,3287,3343,3537,3567,3570,3839,3923,4054,4109,4152,4296
#                               ,4318,4387,4620,4799,4805,4962), ], max_sedd, rank = F)

#max_sedpcc<- pcc(inputdata, max_sedd, rank = F)
