par_distribution<- read.csv("C:/git/sinnathamby_pwc/figures/par_distribution.csv", header=TRUE, 
                sep=",")
par_distribution_50<- read.csv("C:/git/sinnathamby_pwc/figures/par_distribution_50.csv", header=TRUE, 
                            sep=",")
library(reshape)
par_distributionm <- melt(par_distribution,id.var=1)
par_distributionm_50 <- melt(par_distribution_50,id.var=1)
attach(par_distributionm)
library(ggplot2)
library (scales)
#scatter plot
ggplot(par_distributionm, aes(x=value, y=max_h20))+geom_point(alpha = 0.2)+
  facet_wrap( ~ variable, scales = "free",ncol=7)+theme_bw()+ stat_smooth(method = "loess") 
#histogram  
ggplot(data=par_distributionm, aes(par_distributionm$value)) + geom_histogram()+geom_density(col=2)+ facet_wrap( ~ variable, scales = "free",ncol=7)

 # scale_y_log10(breaks = trans_breaks("log10", function(x) 10^x),labels = trans_format("log10", math_format(10^.x)))


  ggplot(par_distributionm_50, aes(x=value, y=max_h20))+geom_point(alpha = 0.2)+
    facet_wrap( ~ variable, scales = "free",ncol=7)+theme_bw()+ stat_smooth(method = "loess") 

  ggplot(data=par_distributionm_50, aes(par_distributionm_50$value)) + geom_histogram()+ geom_density(col=2) +facet_wrap( ~ variable, scales = "free",ncol=7)
  
#
#+ 

ggplot(data=par_distributionm, aes(x=max_h20, y=value, shape=variable,color=variable)) +
  geom_point(alpha = 0.2)+stat_smooth()+
  theme_bw()