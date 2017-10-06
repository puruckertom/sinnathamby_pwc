#create input distributions
weather_file<- rep(paste(pwc_weather, sep = ""), Nsims)
sim_start<- rep(paste(simstart, sep = ""), Nsims)
sim_end<- rep(paste(simend, sep = ""), Nsims)
inputdf<- data.frame(weather_file, sim_start, sim_end)

##initial parameter distributions
depositionrate<- runif(Nsims, 0.1, 58); inputdf <- cbind(inputdf, depositionrate) #Depositionrate
efficiency<-runif(Nsims, 0.1, 1); inputdf <- cbind(inputdf, efficiency) #Efficiency
drfitfraction<-runif(Nsims, 0.1, 1); inputdf <- cbind(inputdf, drfitfraction) #Drfitfraction

#putting the input in the io directory so it can be read from there later
write.csv(inputdf, file = paste(pwcdir_in_przm, "inputdata.csv", sep = ""))
write.csv(inputdf, file = paste(pwcdir_in_vvwm, "inputdata.csv", sep = ""))