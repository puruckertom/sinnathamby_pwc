# #############################  CONTROL ######################################
# ndays <- length(timearray)
# 
# ## load przm output
# 
# dim(outputdf)
# outputdf[1:10,,1]#check output
# 
# pestoutput <- outputdf[,7,1:Nsims]#6pesticide concentration in runoff, 7 pesticide concentration in erosion,8pesticide concentration in pore water
# 
# dim(pestoutput)
# dim(inputdata)
# nvars <- length(inputdata)#number of input variables
# dim(nvars)
# #create partial correlation coefficients array for output
# tarray_pccout<- array(data=NA, c(ndays,nvars))#create time series input array
# 
# #partial correlation coefficients
# for (i in 1:ndays){  #break
#   temp<- pestoutput[i,1:Nsims]
#   #inputdata$PFAC <- tdarray[i,27,] 
#   temp_pcc<- pcc(inputdata, temp, rank = F)
#   print(paste(i,"out of",ndays)) 
#   tarray_pccout[i,] <- temp_pcc$PCC[[1]]
# }
# 
# #write control pcc results to disk
# dim(tarray_pccout)
# save(tarray_pccout,file = paste(pwcdir,"io/tarray_pccout.RData", sep = ""))
# #write.csv(tarray_pccout, file = paste(pwcdir, "io/tarray_pccout.csv", sep = ""))
#####################################################################################################################
#############################  PWC ######################################
ndays <- length(timearray)

## load przm output

dim(pwcoutdf)
pwcoutdf[1:10,,1]#check output

pwch2output <- pwcoutdf[,4,1:Nsims]#1depth, 2Ave.Conc.H20, 3Ave.Conc.benth, 4Peak.Conc.H20

dim(pwch2output)# simulations x variables
dim(inputdata)# days x simulations
nvars <- length(inputdata)#number of input variables

#create partial correlation coefficients array for input
tarray_pwcpccout<- array(data=NA, c(ndays,nvars))

#partial correlation coefficients
for (i in 1:ndays){  #break
  out_sim<- pwch2output[i,1:Nsims]
  
  temp_pcc<- pcc(inputdata[1:Nsims,], out_sim, rank = F)
  print(paste(i,"out of",ndays)) 
  tarray_pwcpccout[i,] <- temp_pcc$PCC[[1]]
}

#write control pcc results to disk
dim(tarray_pwcpccout)
save(tarray_pwcpccout,file = paste(pwcdir,"io/tarray_pwcpccout.RData", sep = ""))
write.csv(tarray_pwcpccout, file = paste(pwcdir, "io/tarray_pccout.csv", sep = ""))


