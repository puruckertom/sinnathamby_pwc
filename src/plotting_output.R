#load pwc output
load(paste(pwcdir, "io/pwcout.RData", sep = ""))
#check data
head(pwcoutdf)
#extract pesticide concentration in water and change the unit from kg/m3 to ug/l
pwch2output <- (pwcoutdf[,2,1:Nsims]*1000000)
head(pwch2output)
#define percentiles
quants <- c(0.025,0.05,0.25,0.5,0.75,0.95,0.975)
#quants <- c(0.68,0.95,0.997)
#install.packages("matrixStats")
library(matrixStats)
q <- rowQuantiles(pwch2output, probs = quants)

print(q)
#write.csv(q, file = paste(pwcdir, "io/quantoutput.csv", sep = ""))
#create df
#q <- array(data=NA, c(5844,5))

pesticide_con<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/vvwm/diazinon/watershed1/diazinon.csv", header=TRUE, 
                         sep=",")

##all at log 10
plot(days[1:5844],log10(q[1:5844,"25%"]),type='l',lwd=2,col = "red",xlab="Number of days from beginning year (1999)", ylab="Diazinon Concentration (ug/l)",yaxt="n")
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

plot(days[1097:2000],(q[1097:2000,"25%"]),log="y",type='l',lwd=2,col = "red",xlab="Number of days from beginning year (1999)", ylab="Diazinon Concentration (ug/l)",bty = "n",ylim=c(0.001,1))
lines(days[1097:2000],(q[1097:2000,"50%"]),log="y", type='l',lty=2,col = "darkblue")
lines(days[1097:2000],q[1097:2000,"75%"],log="y",type='l',lty=2,col = "green")
lines(days[1097:2000],q[1097:2000,"97.5%"],log="y",type='l',lty=2,col = "blue")
points(days[1097:2000],pesticide_con[1097:2000,"Observed"],log="y",type='p',pch=15)
points(days[1097:2000],pesticide_con[1097:2000,"San.Luis.NWR.KST62"],log="y",type='p',pch=16,col = "darkblue")
points(days[1097:2000],pesticide_con[1097:2000,"San.Luis.NWR.KST63"],log="y",type='p',pch=17,col = "orange")
points(days[1097:2000],pesticide_con[1097:2000,"San.Luis.NWR.KST63.1"],log="y",type='p',pch=18,col = "darkgreen")
eaxis(2, padj=-0.5, cex.axis=0.8)
#plot(days[1:5844],pesticide_con[1:5844,"San.Luis.NWR.KST63.1"],type='p',pch=18,col = "bisque")
abline(h =0.001,lty=c(5), lwd=c(1),col = "black")
par(op)
par(xpd=TRUE)
legend(1100, 10, legend=c("25%", "50%","75%","97.5%","Measured Stream/ river concentration","San Luis NWR KST62","San Luis NWR KST63","San Luis NWR KST63-1","Limit of detection" ),
       col=c("red","darkblue","green","blue","black","darkblue","orange","darkgreen","black"), lty=c(1,2,3,4,NA,NA, NA, NA,5), pch=c(NA, NA, NA,NA,15,16,17,18,NA),cex=0.9,ncol=2,bg="transparent")

op <- par(mar=c(8,9, 4, 2) + 0.1)

#############################################################################################################
#with observed data

diazinon_con<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/vvwm/diazinon/watershed1/diazinon0203.csv", header=TRUE, 
                        sep=",")



diazinon_con$Date <- as.Date(diazinon_con$Date, "%m/%d/%Y")
# par(oma = c(1, 1, 1, 1))

plot(diazinon_con$Date,diazinon_con$pool.high,log="y",type='l',lty=2,col = "red",xlab="Year", ylab="Diazinon Concentration (ug/l)",bty = "n")#,,yaxt = "n"
lines(diazinon_con$Date,diazinon_con$pool.low,log="y",type='l',lty=2,col = "blue")
lines(diazinon_con$Date,diazinon_con$custom,log="y",type='l',lty=2,col = "green")
points(diazinon_con$Date,diazinon_con$Observed,log="y",type='p',pch=15)
points(diazinon_con$Date,diazinon_con$San.Luis.NWR.KST62,log="y",type='p',pch=16,col = "darkblue")
points(diazinon_con$Date,diazinon_con$San.Luis.NWR.KST63,log="y",type='p',pch=17,col = "orange")
points(diazinon_con$Date,diazinon_con$San.Luis.NWR.KST63.1,log="y",type='p',pch=18,col = "darkgreen")


legend("topright", legend=c("Pool (depth=1m)", "Pool (depth=0.1m)","Pool (depth=0.3m)","Measured Stream/ river concentration","San Luis NWR KST62","San Luis NWR KST63","San Luis NWR KST70" ),
       col=c("red", "blue","green","black","darkblue","orange","darkgreen"), lty=c(1,2,3,NA,NA, NA, NA), bty = "n",pch=c(NA, NA, NA,15,16,17,18),cex=0.8,ncol=2,bg="transparent")






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



