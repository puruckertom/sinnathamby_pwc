# Multiple plot function
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}



par_distribution<- read.csv("C:/git/sinnathamby_pwc/figures/par_distribution.csv", header=TRUE, 
                sep=",")
max_distribution<- read.csv("C:/git/sinnathamby_pwc/io/inputdata_przm_vvwm_max.csv", header=TRUE, 
                            sep=",")
#par_distribution_50<- read.csv("C:/git/sinnathamby_pwc/figures/par_distribution_50.csv", header=TRUE,sep=",")
#install.packages("reshape2") 
library(reshape)
par_distributionm <- melt(par_distribution,id.var=1)
#par_distributionm_50 <- melt(par_distribution_50,id.var=1)
attach(par_distributionm)
attach(max_distribution)
library(ggplot2)
library (scales)
#scatter plot
ggplot(par_distributionm, aes(x=value, y=max_h20))+geom_point(alpha = 0.2)+
  facet_wrap( ~ variable, scales = "free",ncol=8)+theme_bw()+ stat_smooth(method = "loess") 

ggplot(par_distributionm, aes(x=value, y=max_h20))+geom_point()+
  facet_wrap( ~ variable, scales = "free",ncol=8)+theme_bw()



par_distribution_sen<- read.csv("C:/git/sinnathamby_pwc/figures/par_distribution_sen.csv", header=TRUE, 
                            sep=",")
library(reshape)
par_distribution_senm <- melt(par_distribution_sen,id.var=1)
ggplot(par_distribution_senm, aes(x=value, y=max_h20))+geom_point()+
  facet_wrap( ~ variable, scales = "free",ncol=3)+theme_bw() 

par_distribution_ben<- read.csv("C:/git/sinnathamby_pwc/figures/par_distribution_ben.csv", header=TRUE, 
                                sep=",")
library(reshape)
par_distribution_benm <- melt(par_distribution_ben,id.var=1)
ggplot(par_distribution_benm, aes(x=value, y=max_ben))+geom_point()+
  facet_wrap( ~ variable, scales = "free",ncol=3)+theme_bw()

par_distribution_sed<- read.csv("C:/git/sinnathamby_pwc/figures/par_distribution_sed.csv", header=TRUE, 
                                sep=",")
library(reshape)
par_distribution_sedm <- melt(par_distribution_sed,id.var=1)
ggplot(par_distribution_sedm, aes(x=value, y=max_sed))+geom_point()+
  facet_wrap( ~ variable, scales = "free",ncol=3)+theme_bw()

a<-ggplot() + geom_histogram(aes(max_distribution$max_h20),fill = "red", alpha = 0.2,color="black")+scale_x_log10()
b<-ggplot()  + geom_histogram(aes(max_distribution$max_sedd),fill = "green", alpha = 0.2,color="black")+scale_x_log10()
c<-ggplot() + geom_histogram(aes(max_distribution$max_ben),fill = "blue", alpha = 0.2,color="black")+scale_x_log10()
d<-a+ geom_vline(aes(xintercept=median(max_distribution$max_h20)),
             color="red", linetype="dashed", size=1)+ theme_classic()+ labs(x = "Maximum pesticide concentration in water") 
e<-b+ geom_vline(aes(xintercept=median(max_distribution$max_sedd)),
                 color="green", linetype="dashed", size=1)+ theme_classic() + labs(x = "Maximum pesticide concentration in sediment") 
f<-c+ geom_vline(aes(xintercept=median(max_distribution$max_ben)),
                 color="blue", linetype="dashed", size=1)+ theme_classic() + labs(x = "Maximum pesticide concentration in benthic") 
multiplot(d, e, f, cols=2)


ggplot() + geom_histogram(aes(max_distribution$max_h20),fill = "red", alpha = 0.2,color="black")+ geom_histogram(aes(max_distribution$max_sedd),fill = "green", alpha = 0.2,color="black")+
 geom_histogram(aes(max_distribution$max_ben),fill = "blue", alpha = 0.2,color="black")+scale_x_log10()

library(reshape)
#pwc output
load(paste(pwcdir, "io/pwcout.RData", sep = ""))
head(pwcoutdf)
a<-pwcoutdf[,-1,1:Nsims]
head(a)
b<-a[,-3,1:Nsims]
c<- melt(b)
head(c)
colnames(c) <- c("day","variable","aaa","value")
options("scipen"=100, "digits"=4)
g <- ggplot(c,aes(x=value*1000000))
g <- g + geom_histogram()
g <- g + facet_wrap(~variable)+scale_x_log10(limits=c(0.000001, 20))+
  geom_vline(aes(xintercept=0.04, linetype=name),show.legend =FALSE, color="red", linetype="dashed", size=1) + 
  geom_vline(xintercept=0.1, color="blue" ,linetype="dashed", size=1) + 
  geom_vline(xintercept=1.1, color="black", linetype="dashed", size=1) + 
  geom_vline(xintercept=0.259, color="green", linetype="dashed", size=1)+
  theme(axis.title.x = element_text(colour="black", size=14),axis.text.x  = element_text(size=14))+ 
  theme(axis.title.y = element_text(colour="black", size=14),axis.text.y  = element_text(size=14,colour="black" ))+
  theme(legend.key.size = unit(0.5, "in"))+
  theme(legend.text=element_text(size=14))+guides(fill=guide_legend(nrow=2,byrow=TRUE)) 

group.colors <- c(rep("red"), rep("blue"))
g <- ggplot(c,aes(x=value*1000000,fill=variable ))
g <- g + geom_histogram(aes(y = (..count..)/sum(..count..)),alpha=0.5,color="black", position="identity")+scale_x_log10(limits=c(0.000001, 100))
g <- g + scale_fill_manual(values=group.colors)+theme_classic()+
  #geom_vline(aes(xintercept=0.04, linetype=name),show.legend =FALSE, color="red", linetype="dashed", size=1) + 
  #geom_vline(xintercept=0.1, color="blue" ,linetype="dashed", size=1) + 
  #geom_vline(xintercept=1.1, color="black", linetype="dashed", size=1) + 
  geom_vline(xintercept=0.17, color="black", size=1)+
  theme(axis.title.x = element_text(colour="black", size=14),axis.text.x  = element_text(size=14))+ 
  theme(axis.title.y = element_text(colour="black", size=14),axis.text.y  = element_text(size=14,colour="black" ))+
  theme(legend.key.size = unit(0.5, "in"))+
  theme(legend.text=element_text(size=14))+guides(fill=guide_legend(nrow=2,byrow=TRUE))+labs(x = "log [Diazinon daily average concentration (ug/l)]",y = "Relative frequency") 

sum(c$value*1000000>0.17)
dim(c)
ggplot() + geom_histogram(aes((pwcoutdf["Ave.Conc.H20"])*1000000),fill = "red", alpha = 0.2,color="black")+
  geom_histogram(aes((pwcoutdf["Ave.Conc.benth"])*1000000),fill = "blue", alpha = 0.2,color="black")+scale_x_log10()




options("scipen"=100, "digits"=4)
max_con<- read.csv("C:/git/sinnathamby_pwc/io/media_max_con1.csv", header=TRUE, 
                            sep=",")
ggplot(max_con, aes(x=Concentration, color=Media,fill=Media)) +
  geom_histogram(aes(y = (..count..)/sum(..count..)),alpha=0.5, position="identity")+
  scale_x_log10()+scale_color_manual(labels = c("Benthic", "Water","Observed","stream"),values=c("green","blue" , "red","black"))+
  scale_fill_manual(labels = c("Benthic", "Water","Stream","Observed"),values=c("green","blue" , "red","black"))+ labs(y = "Relative frequency")+ theme_classic()+
  geom_vline(aes(xintercept=0.04, linetype=name),show.legend =FALSE, color="red", linetype="dashed", size=1) + 
  geom_vline(xintercept=0.1, color="blue" ,linetype="dashed", size=1) + 
  geom_vline(xintercept=1.1, color="black", linetype="dashed", size=1) + 
  geom_vline(xintercept=0.259, color="green", linetype="dashed", size=1)+
theme(axis.title.x = element_text(colour="black", size=14),axis.text.x  = element_text(size=14))+ 
theme(axis.title.y = element_text(colour="black", size=14),axis.text.y  = element_text(size=14,colour="black" ))+
  theme(legend.key.size = unit(0.5, "in"))+
  theme(legend.text=element_text(size=14))+guides(fill=guide_legend(nrow=2,byrow=TRUE))                                                                                                     

test<- read.csv("C:/git/sinnathamby_pwc/io/test.csv", header=TRUE, 
                   sep=",")
#library(lattice)
attach(test)
ggplot(test) +
geom_histogram(aes(x=max_ben, y =(..count..)/sum(..count..)),alpha=0.5,fill="green")+ 
geom_histogram(aes(x=max_h20, y =(..count..)/sum(..count..)),alpha=0.5,fill="blue")+ 
geom_histogram(aes(x=Stream, y =(..count..)/sum(..count..)), fill="red")+
geom_histogram(aes(x=Observed, y =(..count..)/sum(..count..)),alpha=0.5,fill="black")+ scale_x_log10()+
labs(x="log [Maximum concentration (ug/l)]",y = "Relative frequency")+ theme_classic()+
#geom_vline(aes(xintercept=0.04, linetype=name),show.legend =FALSE, color="red", linetype="dashed", size=1)+ 
#geom_vline(xintercept=0.1, color="blue" ,linetype="dashed", size=1) + 
#geom_vline(xintercept=1.1, color="black", linetype="dashed", size=1) + 
#geom_vline(xintercept=0.259, color="green", linetype="dashed", size=1)+
geom_vline(xintercept=0.17, color="black", size=1)+
theme(axis.title.x = element_text(colour="black", size=14),axis.text.x  = element_text(size=14))+ 
theme(axis.title.y = element_text(colour="black", size=14),axis.text.y  = element_text(size=14,colour="black" ))+
theme(legend.key.size = unit(0.5, "in"))+
theme(legend.text=element_text(size=14))+guides(fill=guide_legend(nrow=2,byrow=TRUE))  

sum(test$max_ben>0.17)
sum(test$max_h20>0.17)
dim(test)
# ggplot(max_con, aes(x=Concentration, color=Media,fill=Media)) + 
#   geom_histogram(alpha=0.5, position="identity")+
#   scale_x_log10()+scale_color_manual(labels = c("Benthic", "Water","Sediment"),values=c("green","blue" , "red"))+
#   scale_fill_manual(labels = c("Benthic", "Water","Sediment"),values=c("green","blue" , "red"))+ labs(y = "Frequency")+ theme_classic()+
#   geom_vline(aes(xintercept=0.04, linetype=name),show.legend =FALSE, color="red", linetype="dashed", size=1) + 
#   geom_vline(xintercept=0.1, color="blue" ,linetype="dashed", size=1) + 
#   geom_vline(xintercept=1.1, color="black", linetype="dashed", size=1) + 
#   geom_vline(xintercept=0.259, color="green", linetype="dashed", size=1)+
#   theme(axis.title.x = element_text(colour="black", size=14),axis.text.x  = element_text(size=14))+ 
#   theme(axis.title.y = element_text(colour="black", size=14),axis.text.y  = element_text(size=14,colour="black" ))+
#   theme(legend.key.size = unit(0.5, "in"))+
#   theme(legend.text=element_text(size=14))+guides(fill=guide_legend(nrow=2,byrow=TRUE))    





#histogram  
ggplot(data=par_distributionm, aes(par_distributionm$value)) + geom_histogram()+geom_density(col=2)+ facet_wrap( ~ variable, scales = "free",ncol=7)

ggplot(data=par_distributionm, aes(par_distributionm$value)) +
  geom_histogram(binwidth=.5, colour="black", fill="white")+facet_wrap( ~ variable, scales = "free",ncol=7)

ggplot(data=par_distribution, aes(par_distribution$max_h20)) +
  geom_histogram(binwidth=5, colour="black", fill="white")

 # scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),labels = trans_format("log10", math_format(10^.x)))


  ggplot(par_distributionm_50, aes(x=value, y=max_h20))+geom_point(alpha = 0.2)+
    facet_wrap( ~ variable, scales = "free",ncol=7)+theme_bw()+ stat_smooth(method = "loess") 

  ggplot(data=par_distributionm_50, aes(par_distributionm_50$value)) + geom_histogram()+ geom_density(col=2) +facet_wrap( ~ variable, scales = "free",ncol=7)
  
#
#+ 

ggplot(data=par_distributionm, aes(x=max_h20, y=value, shape=variable,color=variable)) +
  geom_point(alpha = 0.2)+stat_smooth()+
  theme_bw()

##pcc_plot###############################################
pcc_plot<- read.csv("C:/git/sinnathamby_pwc/figures/pcc_plot.csv", header=TRUE, 
                            sep=",")
attach(pcc_plot)
ggplot(pcc_plot, aes(x=Parameter, y=PCC,fill=Media))+geom_bar(colour="black",stat = "identity")+
  facet_wrap(~ Media,ncol=4)+theme_bw()+ theme(legend.position="none")+ coord_flip()