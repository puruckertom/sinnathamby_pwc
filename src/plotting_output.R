dates <- seq(as.Date("01/01/1999", format = "%d/%m/%Y"),by = "days", length = length(q))

#load pwc output
load(paste(pwcdir, "io/pwcout.RData", sep = ""))
#check data
head(pwcoutdf)
#extract pesticide concentration in water and change the unit from kg/m3 to ug/l


library(ggplot2)
library(reshape)
library(tidyr)
pwch2output <- (pwcoutdf[,2,1:Nsims]*1000000)
dim(pwch2output)

pwch2output_tidy <- melt(pwch2output) 
#write.csv(pwch2output_tidy, file = paste(pwcdir, "io/mc_pwcout.csv", sep = ""))

F10 <- ecdf(rnorm(pwch2output))
plot(pwch2output_tidy)

hist(pwch2output_tidy$value)
options(scipen=999)
ggplot(pwch2output_tidy, aes(x=value))+geom_histogram()+scale_x_log10()

head(pwch2output)
dim(pwch2output)
library(KernSmooth)
z <- bkde2D(pwch2output, .5)
persp(z$fhat)

days <- length(timearray)
#pwch2output[pwch2output < 0.001] <- 0
head(pwch2output)
#plot raw data
plot(days[1:5844],pwch2output[1:5844],type='l',lwd=2,col = "red",xlab="Number of days from beginning year (1999)", ylab="Diazinon Concentration (ug/l)")
points(days[1:5844],pesticide_con[1:5844,"Observed"],type='p',pch=15)
points(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST62"],type='p',pch=16,col = "darkblue")
points(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST63"],type='p',pch=17,col = "orange")
points(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST63.1"],type='p',pch=18,col = "darkgreen")
#plot raw data in log scale
plot(days[1:5844],log10(pwch2output[1:5844]),type='l',lwd=2,col = "red",xlab="Number of days from beginning year (1999)", ylab="Diazinon Concentration (ug/l)",yaxt="n")
points(days[1:5844],log10(pesticide_con[1:5844,"Observed"]),type='p',pch=15)
points(days[1:5844],log10(pesticide_con[1:5844,"San.Luis.NWR.KST62"]),type='p',pch=16,col = "darkblue")
points(days[1:5844],log10(pesticide_con[1:5844,"San.Luis.NWR.KST63"]),type='p',pch=17,col = "orange")
points(days[1:5844],log10(pesticide_con[1:5844,"San.Luis.NWR.KST63.1"]),type='p',pch=18,col = "darkgreen")


plot(days[1097:2000],log10(pwch2output[1097:2000]),type='l',lwd=2,col = "grey",xlab="Number of days from beginning year (1999)", ylab="Diazinon Concentration (ug/l)")#,yaxt="n",ylim=c(0.001,1)

points(days[1097:2000],log10(pesticide_con[1097:2000,"Observed"]),type='p',pch=15)
points(days[1097:2000],log10(pesticide_con[1097:2000,"San.Luis.NWR.KST62"]),type='p',pch=16,col = "darkblue")
points(days[1097:2000],log10(pesticide_con[1097:2000,"San.Luis.NWR.KST63"]),type='p',pch=17,col = "orange")
points(days[1097:2000],log10(pesticide_con[1097:2000,"San.Luis.NWR.KST63.1"]),type='p',pch=18,col = "darkgreen")
aty <- axTicks(2)
labels <- sapply(aty,function(i)
  as.expression(bquote(10^ .(i)))
)
axis(2,at=aty,labels=labels)



#same all at log 10 with log="y"
op <- par(mar=c(8,9, 4, 2) + 0.1)
plot(days[1097:2000],(pwch2output[1097:2000]),log="y",type='l',lwd=2,col = "grey",xlab="Number of days from beginning year (1999)", ylab="Diazinon Concentration (ug/l)",bty = "n")#,ylim=c(0.001,1),yaxt="n"
points(days[1097:2000],pesticide_con[1097:2000,"Observed"],log="y",type='p',pch=15)
points(days[1097:2000],pesticide_con[1097:2000,"San.Luis.NWR.KST62"],log="y",type='p',pch=16,col = "darkblue")
points(days[1097:2000],pesticide_con[1097:2000,"San.Luis.NWR.KST63"],log="y",type='p',pch=17,col = "orange")
points(days[1097:2000],pesticide_con[1097:2000,"San.Luis.NWR.KST63.1"],log="y",type='p',pch=18,col = "darkgreen")
#eaxis(2, padj=-0.5, cex.axis=0.8)
#plot(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST63.1"],type='p',pch=18,col = "bisque")
abline(h =0.001,lty=c(5), lwd=c(1),col = "black")
#eaxis(2, padj=-0.5, cex.axis=0.8)
#plot(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST63.1"],type='p',pch=18,col = "bisque")
abline(h =0.001,lty=c(5), lwd=c(1),col = "black")
par(op)
par(xpd=TRUE)
legend(1100, 20, legend=c("PWC simulations","Measured Stream/ river concentration","San Luis NWR KST62","San Luis NWR KST63","San Luis NWR KST63-1","Limit of detection" ),
       col=c("grey","black","darkblue","orange","darkgreen","black"), lty=c(1,NA,NA, NA, NA,2), pch=c(NA,15,16,17,18,NA),cex=0.9,ncol=2,bg="transparent")

op <- par(mar=c(8,9, 4, 2) + 0.1)


load(paste(pwcdir, "io/pwcout.RData", sep = ""))

pwch2output <- (pwcoutdf[,2,1:Nsims]*1000000)
dim(pwch2output)


pwch2obs <- (pwcoutdf[1431:1551,2,1:Nsims]*1000000)
dim(pwch2obs)
write.csv(pwch2obs, file = paste(pwcdir, "io/pwch2obs.csv", sep = ""))
#define percentiles
quants <- c(0.025,0.05,0.25,0.5,0.75,0.95,0.975)
#quants <- c(0.68,0.95,0.997)
#install.packages("matrixStats")
library(matrixStats)
q <- rowQuantiles(pwch2output, probs = quants)
# values = seq(from = as.Date("01-01-1999"), to = as.Date("31-12-2014"), by = 'day')
# merge(q, values, all = T)
"%d/%m/%Y"
days<-c(1:121)
head(q)
obsday = seq(from = as.Date("2002-12-01"), to = as.Date("2003-03-31"), by = 'day')
merge(q, obsday, all = T)
q<- data.frame(q, obsday)
dim(q)
colnames(q) <- c("2.5%","5%","25%","50%","75%","95%","97.5%","Day")
q$Day <-as.Date(q$Day,"%m/%d/%Y")
f<-melt(q,id.vars = Day)

plot(days,log10(q[1:121,"2.5%"]),type='l',lwd=2,col = "red",xlab="Number of days from beginning year (1999)", ylab="Diazinon Concentration (ug/l)",yaxt="n",ylim=c(-3,1))
lines(days[1:121],log10(q[1:121,"50%"]),type='l',lty=2,col = "blue")
lines(days[1:121],log10(q[1:121,"75%"]),type='l',lty=2,col = "green")
lines(days[1:121],log10(q[1:121,"97.5%"]),type='l',lty=2,col = "black")
points(days[1097:2000],log10(pesticide_con[1097:2000,"San.Luis.NWR.KST62"]),type='p',pch=16,col = "darkblue")
points(days[1097:2000],log10(pesticide_con[1097:2000,"San.Luis.NWR.KST63"]),type='p',pch=17,col = "orange")
points(days[1097:2000],log10(pesticide_con[1097:2000,"San.Luis.NWR.KST63.1"]),type='p',pch=18,col = "darkgreen")
#labeling
# mc_con<-melt(pwch2obs)
# head(mc_con)
# colnames(mc_con) <- c("day","col","value")
# ggplot(mc_con, aes(day,value)) + geom_line(aes(colour = col))


pesticide_con<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/vvwm/diazinon/watershed1/diazinon.csv", header=TRUE, 
                         sep=",")

##all at log 10
plot(days[1:5844],log10(q[1:5844,"2.5%"]),type='l',lwd=2,col = "red",xlab="Number of days from beginning year (1999)", ylab="Diazinon Concentration (ug/l)")#,yaxt="n"
lines(days[1:5844],log10(q[1:5844,"50%"]),type='l',lty=2,col = "blue")
lines(days[1:5844],log10(q[1:5844,"75%"]),type='l',lty=2,col = "green")
#lines(days[1:5844],log10(q[1:5844,"97.5%"]),type='l',lty=2,col = "black")
points(days[1:5844],log10(pesticide_con[1:5844,"Observed"]),type='p',pch=15)
points(days[1:5844],log10(pesticide_con[1:5844,"San.Luis.NWR.KST62"]),type='p',pch=16,col = "darkblue")
points(days[1:5844],log10(pesticide_con[1:5844,"San.Luis.NWR.KST63"]),type='p',pch=17,col = "orange")
points(days[1:5844],log10(pesticide_con[1:5844,"San.Luis.NWR.KST63.1"]),type='p',pch=18,col = "darkgreen")
#labeling
aty <- axTicks(2)
labels <- sapply(aty,function(i)
  as.expression(bquote(10^ .(i)))
)
axis(2,at=aty,labels=labels)
#############################################################################################################
#same all at log 10 with log="y"
op <- par(mar=c(8,9, 4, 2) + 0.1)
plot(days[1:5844],(q[1:5844,"25%"]),log="y",type='l',lwd=2,col = "red",xlab="Number of days from beginning year (1999)", ylab="Diazinon Concentration (ug/l)",bty = "n")
lines(days[1:5844],(q[1:5844,"50%"]),log="y", type='l',lty=2,col = "blue")
lines(days[1:5844],(q[1:5844,"75%"]),log="y",type='l',lty=2,col = "green")
lines(days[1:5844],(q[1:5844,"97.5%"]),log="y",type='l',lty=2,col = "black")
points(days[1:5844],pesticide_con[1:5844,"Observed"],log="y",type='p',pch=15)
points(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST62"],log="y",type='p',pch=16,col = "darkblue")
points(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST63"],log="y",type='p',pch=17,col = "orange")
points(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST63.1"],log="y",type='p',pch=18,col = "darkgreen")
#eaxis(2, padj=-0.5, cex.axis=0.8)
#plot(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST63.1"],type='p',pch=18,col = "bisque")
abline(h =0.001,lty=c(5), lwd=c(1),col = "black")



#####################################################################################################################
##for 2002 to 2003

plot(days[1097:2000],log10(q[1097:2000,"25%"]),type='l',lwd=2,col = "red",xlab="Number of days from beginning year (1999)", ylab="Diazinon Concentration (ug/l)",yaxt="n",ylim=c(-3,1))
lines(days[1097:2000],log10(q[1097:2000,"50%"]),type='l',lty=2,col = "blue")
lines(days[1097:2000],log10(q[1097:2000,"75%"]),type='l',lty=2,col = "green")
lines(days[1097:2000],log10(q[1097:2000,"97.5%"]),type='l',lty=2,col = "black")
points(days[1097:2000],log10(pesticide_con[1097:2000,"Observed"]),type='p',pch=15)
points(days[1097:2000],log10(pesticide_con[1097:2000,"San.Luis.NWR.KST62"]),type='p',pch=16,col = "darkblue")
points(days[1097:2000],log10(pesticide_con[1097:2000,"San.Luis.NWR.KST63"]),type='p',pch=17,col = "orange")
points(days[1097:2000],log10(pesticide_con[1097:2000,"San.Luis.NWR.KST63.1"]),type='p',pch=18,col = "darkgreen")
#labeling
aty <- axTicks(2)
labels <- sapply(aty,function(i)
  as.expression(bquote(10^ .(i)))
)
axis(2,at=aty,labels=labels)


op <- par(mar=c(8,9, 4, 2) + 0.1)

plot(days[1400:1600],(q[1400:1600,"25%"]),log="y",type='l',lwd=2,col = "red",xlab="", ylab="Diazinon Concentration (ug/l)",bty = "n",ylim=c(0.001,1))
lines(days[1400:1600],(q[1400:1600,"50%"]),log="y", type='l',lty=2,col = "blue")
lines(days[1400:1600],q[1400:1600,"75%"],log="y",type='l',lty=2,col = "green")
#lines(days[1097:2000],q[1097:2000,"97.5%"],log="y",type='l',lty=2,col = "blue")
points(days[1400:1600],pesticide_con[1400:1600,"Observed"],log="y",type='p',pch=15)
points(days[1400:1600],pesticide_con[1400:1600,"San.Luis.NWR.KST62"],log="y",type='p',pch=16,col = "darkblue")
points(days[1400:1600],pesticide_con[1400:1600,"San.Luis.NWR.KST63"],log="y",type='p',pch=17,col = "orange")
points(days[1400:1600],pesticide_con[1400:1600,"San.Luis.NWR.KST63.1"],log="y",type='p',pch=18,col = "darkgreen")
#eaxis(2, padj=-0.5, cex.axis=0.8)
#plot(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST63.1"],type='p',pch=18,col = "bisque")
abline(h =0.001,lty=c(5), lwd=c(1),col = "black")
par(op)
par(xpd=TRUE)
legend(1400, 1, legend=c("25%", "50%","75%","Measured Stream/ river concentration","San Luis NWR KST62","San Luis NWR KST63","San Luis NWR KST63-1","Limit of detection" ),
       col=c("red","blue","green","black","darkblue","orange","darkgreen","black"), lty=c(1,2,3,NA,NA, NA, NA,4), pch=c(NA, NA, NA,15,16,17,18,NA),cex=0.9,ncol=2,bg="transparent")

op <- par(mar=c(8,9, 4, 2) + 0.1)

#############################################################################################################
#with observed data

diazinon_con<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/vvwm/diazinon/watershed1/diazinon0203.csv", header=TRUE, 
                        sep=",")



diazinon_con$Date <- as.Date(diazinon_con$Date, "%m/%d/%Y")
# par(oma = c(1, 1, 1, 1))
options(scipen=999)
plot(diazinon_con$Date,diazinon_con$pool.high,log="y",type='l',lty=1,col = "red",xlab="Year", ylab="Diazinon Concentration (ug/l)",bty = "n",ylim=c(0.0001,100))#,,yaxt = "n",ylim=c(0.001,0.9)
lines(diazinon_con$Date,diazinon_con$pool.low,log="y",type='l',lty=2,col = "blue")
lines(diazinon_con$Date,diazinon_con$custom,log="y",type='l',lty=1,col = "darkgreen")
points(diazinon_con$Date,diazinon_con$Observed,log="y",type='p',pch=15)
points(diazinon_con$Date,diazinon_con$San.Luis.NWR.KST62,log="y",type='p',pch=16,col = "darkblue")
points(diazinon_con$Date,diazinon_con$San.Luis.NWR.KST63,log="y",type='p',pch=17,col = "orange")
points(diazinon_con$Date,diazinon_con$San.Luis.NWR.KST63.1,log="y",type='p',pch=18,col = "darkgreen")


legend("topright", legend=c("Watershed 1", "Watershed 2","Watershed 3","Measured Stream/ river concentration","San Luis NWR KST62","San Luis NWR KST63","San Luis NWR KST70" ),
       col=c("red", "blue","darkgreen","black","darkblue","orange","darkgreen"), lty=c(1,2,1,NA,NA, NA, NA), bty = "n",pch=c(NA, NA, NA,15,16,17,18),cex=0.8,ncol=2,bg="transparent")


a<-diazinon_con$pool.high
b<-diazinon_con$pool.low
c<-diazinon_con$custom
#d<-dia_w3$con
boxplot(a,at=1,xlim=c(0, 6))#, ,ylim=c(0, 6)
boxplot(b, at=2, add=TRUE)
boxplot(c, at=3, add=TRUE)
boxplot(d, at=4, add=TRUE)
stripchart(diazinon_con$San.Luis.NWR.KST62,at=4, vertical = TRUE, data = diazinon_con, 
           method = "jitter", add = TRUE, pch = 20, col = 'blue')

#################################################################################################
dia_con_obs<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/vvwm/diazinon/watershed1/diazinon0203_new.csv", header=TRUE, 
                        sep=",")



dia_con_obs$Date <- as.Date(dia_con_obs$Date, "%m/%d/%Y")

# par(oma = c(1, 1, 1, 1))
options(scipen=999)
plot(dia_con_obs$Date,dia_con_obs$pool.high,log="y",type='l',lty=1,col = "red",xlab="", ylab="Diazinon Concentration (ug/l)",ylim=c(0.0001,15),xaxt="n")#,,yaxt = "n",ylim=c(0.001,0.9)
axis.Date(1, at = seq(dia_con_obs$Date[1], dia_con_obs$Date[length(dia_con_obs$Date)], by="month"),
          labels= seq(dia_con_obs$Date[1], dia_con_obs$Date[length(dia_con_obs$Date)], by="month"),
          format="%m-%d-%Y", las = 1)
lines(dia_con_obs$Date,dia_con_obs$pool.low,log="y",type='l',lty=2,col = "blue")
lines(dia_con_obs$Date,dia_con_obs$custom,log="y",type='l',lty=1,col = "darkgreen")
#points(diazinon_con$Date,diazinon_con$Observed,log="y",type='p',pch=15)
points(dia_con_obs$Date,dia_con_obs$San.Luis.NWR.KST62,log="y",type='p',pch=16,col = "darkblue")
points(dia_con_obs$Date,dia_con_obs$San.Luis.NWR.KST63,log="y",type='p',pch=17,col = "orange")
points(dia_con_obs$Date,dia_con_obs$San.Luis.NWR.KST63.1,log="y",type='p',pch=18,col = "darkgreen")


legend("bottomright", legend=c("Watershed 1", "Watershed 2","Watershed 3","San Luis NWR KST62","San Luis NWR KST63","San Luis NWR KST70" ),
       col=c("red", "blue","darkgreen","darkblue","orange","darkgreen"), lty=c(1,2,1,NA, NA, NA), bty = "n",pch=c(NA, NA, NA,16,17,18),cex=1,ncol=2,bg="transparent")

days<-c(1:5844)
head(q)
obsday = seq(from = as.Date("2002-12-01"), to = as.Date("2003-03-31"), by = 'day')
merge(q, obsday, all = T)
q<- data.frame(q, obsday)
dim(q)
colnames(q) <- c("2.5%","5%","25%","50%","75%","95%","97.5%","Day")
q$Day <-as.Date(q$Day,"%m/%d/%Y")
f<-melt(q,id.vars = Day)
options(scipen=999)
plot(days[1:5844],(q[1:5844,"25%"]),log="y",type='l',lwd=2,col = "red",xlab="", ylab="Diazinon Concentration (ug/l)",ylim=c(0.0001,100))#,
lines(days[1:5844],(q[1:5844,"50%"]),log="y",type='l',lty=2,col = "blue")
lines(days[1:5844],(q[1:5844,"75%"]),log="y",type='l',lty=2,col = "green")
lines(days[1:5844],(q[1:5844,"97.5%"]),log="y",type='l',lty=2,col = "black")
points(days[1:121],(dia_con_obs[1:121,"San.Luis.NWR.KST62"]),log="y",type='p',pch=16,col = "darkblue")
points(days[1:121],(dia_con_obs[1:121,"San.Luis.NWR.KST63"]),log="y",type='p',pch=17,col = "orange")
points(days[1:121],(dia_con_obs[1:121,"San.Luis.NWR.KST63.1"]),log="y",type='p',pch=18,col = "darkgreen")

legend("topleft", legend=c("25%", "50%","75%","97.5%","San Luis NWR KST62","San Luis NWR KST63","San Luis NWR KST70" ),
       col=c("red", "blue","green","black","darkblue","orange","darkgreen"), lty=c(1,2,2,2,NA, NA, NA), bty = "n",pch=c(NA, NA, NA,NA,16,17,18),cex=1,ncol=2,bg="transparent")


#labeling

# dates <- seq(as.Date("01/01/1999", format = "%d/%m/%Y"),
#              by = "days", length = length(q))
# install.packages("sfsmisc")
# library(sfsmisc)
# plot(days[1:5844],(q[1:5844,"25%"]),log="y",type='l',lwd=2,col = "red",xlab="Number of days from beginning year (1999)", ylab="Diazinon Concentration (ug/l)",bty = "n")
# lines(days[1:5844],(q[1:5844,"50%"]),log="y", type='l',lty=2,col = "blue")
# lines(days[1:5844],(q[1:5844,"75%"]),log="y",type='l',lty=2,col = "green")
# lines(days[1:5844],(q[1:5844,"97.5%"]),log="y",type='l',lty=2,col = "black")
# points(days[1:5844],pesticide_con[1:5844,"Observed"],log="y",type='p',pch=15)
# points(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST62"],log="y",type='p',pch=16,col = "darkblue")
# points(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST63"],log="y",type='p',pch=17,col = "orange")
# points(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST63.1"],log="y",type='p',pch=18,col = "darkgreen")
# eaxis(2, padj=-0.5, cex.axis=0.8)
# #plot(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST63.1"],type='p',pch=18,col = "bisque")
# abline(h =0.001,lty=c(5), lwd=c(1),col = "black")




# plot(days[1097:2000],(q[1097:2000,"25%"]),log="y",type='l',lwd=2,col = "red",xlab="Number of days from beginning year (1999)", ylab="Diazinon Concentration (ug/l)",bty = "n",ylim=c(0.001,1))
# lines(days[1097:2000],(q[1097:2000,"50%"]),log="y", type='l',lty=2,col = "blue")
# lines(days[1097:2000],q[1097:2000,"75%"],log="y",type='l',lty=2,col = "green")
# points(days[1097:2000],pesticide_con[1097:2000,"Observed"],log="y",type='p',pch=15)
# points(days[1097:2000],pesticide_con[1097:2000,"San.Luis.NWR.KST62"],log="y",type='p',pch=16,col = "darkblue")
# points(days[1097:2000],pesticide_con[1097:2000,"San.Luis.NWR.KST63"],log="y",type='p',pch=17,col = "orange")
# points(days[1097:2000],pesticide_con[1097:2000,"San.Luis.NWR.KST63.1"],log="y",type='p',pch=18,col = "darkgreen")
# #eaxis(2, padj=-0.5, cex.axis=0.8)
# #plot(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST63.1"],type='p',pch=18,col = "bisque")
# abline(h =0.001,lty=c(5), lwd=c(1),col = "black")
# par(op)
# par(xpd=TRUE)
# legend(1100, 5, legend=c("25%", "50%","75%","Measured Stream/ river concentration","San Luis NWR KST62","San Luis NWR KST63","San Luis NWR KST63-1","Limit of detection" ),
#        col=c("red", "blue","green","black","darkblue","orange","darkgreen","black"), lty=c(1,2,3,NA,NA, NA, NA,5), pch=c(NA, NA, NA,15,16,17,18,NA),cex=0.9,ncol=2,bg="transparent")






# op <- par(mar=c(4,5, 4, 2) + 0.1)
# 
# plot(days[1:5844],(q[1:5844,"25%"]),log="y",type='l',lwd=2,col = "red",xlab="Number of days from beginning year (1999)", ylab="Diazinon Concentration (ug/l)",yaxt="n",bty = "n",ylim=c(0.0001,1))
# lines(days[1:5844],(q[1:5844,"50%"]),log="y", type='l',lty=2,col = "blue")
# lines(days[1:5844],q[1:5844,"75%"],log="y",type='l',lty=2,col = "green")
# points(days[1:5844],pesticide_con[1:5844,"Observed"],log="y",type='p',pch=15)
# points(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST62"],log="y",type='p',pch=16,col = "darkblue")
# points(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST63"],log="y",type='p',pch=17,col = "orange")
# points(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST63.1"],log="y",type='p',pch=18,col = "darkgreen")
# eaxis(2, padj=-0.5, cex.axis=0.8)
# #plot(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST63.1"],type='p',pch=18,col = "bisque")
# abline(h =0.001,lty=c(5), lwd=c(1),col = "black")
# 
# par(op)
# par(xpd=TRUE)
# legend(1200, 10, legend=c("25%", "50%","75%","Measured Stream/ river concentration","San Luis NWR KST62","San Luis NWR KST63","San Luis NWR KST63-1","Limit of detection" ),
#        col=c("red", "blue","green","black","darkblue","orange","darkgreen","black"), lty=c(1,2,3,NA,NA, NA, NA,5), pch=c(NA, NA, NA,15,16,17,18,NA),cex=0.8,ncol=2,bg="transparent",bty = "n")
# 
# # 
# # #log10(-6)
# # Add a legend
# #legend(1000, 1, legend=c("25%", "50%","75%","Measured Stream/ river concentration","San Luis NWR KST62","San Luis NWR KST63","San Luis NWR KST63-1","Limit of detection" ),
# #       col=c("red", "blue","green","black","darkblue","orange","darkgreen","black"), lty=c(1,2,3,NA,NA, NA, NA,5), pch=c(NA, NA, NA,15,16,17,18,NA),cex=0.8,ncol=2,bg="transparent",bty = "n")
# par(op)
# par(xpd=TRUE)
# legend(2000, 10, legend=c("25%", "50%","75%","Measured Stream/ river concentration","San Luis NWR KST62","San Luis NWR KST63","San Luis NWR KST63-1","Limit of detection" ),
#       col=c("red", "blue","green","black","darkblue","orange","darkgreen","black"), lty=c(1,2,3,NA,NA, NA, NA,5), pch=c(NA, NA, NA,15,16,17,18,NA),cex=0.8,ncol=2,bg="transparent",bty = "n")



# x <- rnorm(50)
# y <- 2*exp(x) + rexp(50)

# plot(x, y)            # y-scale,     y-scale-labels
# plot(x, y, log = "y") # log-y-scale, y-scale-labels
# plot(x, log(y))  


# legend("topright", c("Pool (depth=1m)", "Pool (depth=0.1m)","Pool (depth=0.03m)","Measured Stream/ river concentration","San Luis NWR KST62","San Luis NWR KST63","San Luis NWR KST70" ), 
#        xpd = TRUE, inset = c(1.1,1.1), col=c("red", "blue","green","black","darkblue","orange","darkgreen"), lty=c(1,2,3,NA,NA, NA, NA), 
#        pch=c(NA, NA, NA,15,16,17,18),bg="transparent",cex = 0.8,ncol=3)


#

#par(mar=c(5, 4, 4, 2) + 0.1)


# getOption("scipen")
# opt <- options("scipen" = 20)
# getOption("scipen")
# 
# plot(days[1097:2000],log10(q[1097:2000,"25%"]),type='l',lwd=2,col = "red",xlab="Number of days from beginning year (1999)", ylab="Diazinon Concentration (ug/l)",ylim=c(-10,1))
# lines(days[1097:2000],log10(q[1097:2000,"50%"]),type='l',lty=2,col = "blue")
# lines(days[1097:2000],log10(q[1097:2000,"97.5%"]),type='l',lty=2,col = "green")
# points(days[1097:2000],log10(pesticide_con[1097:2000,"Observed"]),type='p',pch=15)
# points(days[1097:2000],log10(pesticide_con[1097:2000,"San.Luis.NWR.KST62"]),type='p',pch=16,col = "darkblue")
# points(days[1097:2000],log10(pesticide_con[1097:2000,"San.Luis.NWR.KST63"]),type='p',pch=17,col = "orange")
# points(days[1097:2000],log10(pesticide_con[1097:2000,"San.Luis.NWR.KST63.1"]),type='p',pch=18,col = "darkgreen")
# 
# options(opt)
# legend(1200, 1, legend=c("25%", "50%","75%","Measured Stream/ river concentration","San Luis NWR KST62","San Luis NWR KST63","San Luis NWR KST63-1" ),
#        col=c("red", "blue","green","black","darkblue","orange","darkgreen"), lty=c(1,2,3,NA,NA, NA, NA), pch=c(NA, NA, NA,15,16,17,18),cex=0.8,ncol=2)
# 
#   
#Ploting USGS,EPA data
##You need to install first dataRetrieval[install.packages("dataRetrieval")]
#install.packages("leaflet")
##Then install all libraries 
library(dataRetrieval)
library(ggplot2)
library(dplyr)
library(leaflet)

#vignette("dataRetrieval",package = "dataRetrieval")
##The following function returns sites that have collected phosphorus data in Kansas. There's no way to know if that site has collected one sample, or thousands.
DiazinonSites <- whatWQPsites(statecode="CA",characteristicName="Diazinon")
## So, to get that information, you need to actually get that data.
DiazinonData <- readWQPdata(statecode="CA",characteristicName="Diazinon")
unique(DiazinonData$ResultMeasure.MeasureUnitCode)
unique(DiazinonData$ActivityMediaName)
DiazinonData$ActivityStartDate <-as.Date(DiazinonData$ActivityStartDate,"%m/%d/%Y")

write.table(DiazinonData, "C:/Users/SSinnath/Research/CAVernalPools/Pesticidedata/NWS/Diazinon.txt",sep="\t")
write.table(DiazinonSites, "C:/Users/SSinnath/Research/CAVernalPools/Pesticidedata/NWS/Diazinonsite.txt",sep="\t")
diazinon_wqp <- DiazinonData %>%
  filter(ResultMeasure.MeasureUnitCode %in% c("ug/l")) %>%
  # group_by(MonitoringLocationIdentifier) %>%
  # summarise(count=n(),
  #           start=min(ActivityStartDateTime),
  #           end=max(ActivityStartDateTime),
  #           max = max(ResultMeasureValue, na.rm = TRUE)) %>%
  filter(ActivityMediaName %in% c("Water")) %>%
  filter(ActivityStartDate >"2001-12-31" & ActivityStartDate  <"2004-01-01") %>%
  arrange(ActivityStartTime.Time) %>%
  left_join( DiazinonSites, by = "MonitoringLocationIdentifier")

summary(diazinon_wqp$ResultMeasureValue)
diazinon_con<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/vvwm/diazinon/watershed1/diazinon0203.csv", header=TRUE, 
                        sep=",")

diazinon_con$Date <- as.Date(diazinon_con$Date, "%m/%d/%Y")
pur_dia<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/Pesticidedata/surfdata/SURF Water Table, Updated August 9, 2017 (Final)/diazinon_pur_2002_2003.csv", header=TRUE,sep=",")
#head(pur_data_all)

summary(pur_dia$CONCENTRATION..ppb.)
pur_dia$SAMPLE.DATE <-as.Date(pur_dia$SAMPLE.DATE,"%m/%d/%Y")

# par(oma = c(1, 1, 1, 1))
options(scipen=999)
plot(diazinon_con$Date,diazinon_con$pool.high,log="y",type='l',lty=1,col = "red",xlab="Year", ylab="Diazinon Concentration (ug/l)",bty = "n", lwd=1.5, major.format = "%Y-%m")#,,ylim=c(0.0001,100),yaxt = "n",ylim=c(0.001,0.9)
lines(diazinon_con$Date,diazinon_con$pool.low,log="y",type='l',lty=1,col = "blue", lwd=1.5)
lines(diazinon_con$Date,diazinon_con$custom,log="y",type='l',lty=1,col = "darkgreen", lwd=1.5)
#points(diazinon_wqp$ActivityStartDate,diazinon_wqp$ResultMeasureValue,log="y",type='p',lty=2,col =alpha("blue",0.2))
points(diazinon_con$Date,diazinon_con$San.Luis.NWR.KST62,log="y",type='p',pch=16,col = "darkblue",cex=1.5)
points(diazinon_con$Date,diazinon_con$San.Luis.NWR.KST63,log="y",type='p',pch=17,col = "orange",cex=1.5)
points(diazinon_con$Date,diazinon_con$San.Luis.NWR.KST63.1,log="y",type='p',pch=18,col = "darkgreen",cex=1.5)
#points(pur_dia$SAMPLE.DATE,pur_dia$CONCENTRATION..ppb.,log="y",type='p',lty=2,col =alpha( "black",0.2))

legend("top", legend=c("Watershed 1", "Watershed 2","Watershed 3","San Luis NWR KST62","San Luis NWR KST63","San Luis NWR KST70" ),
       col=c("red", "blue","darkgreen","darkblue","orange","darkgreen"), lty=c(1,1,1,NA,NA, NA), bty = "n",pch=c(NA, NA, NA,16,17,18),cex=0.8,ncol=2,bg="transparent")




