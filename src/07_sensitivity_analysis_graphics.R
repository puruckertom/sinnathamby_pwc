########### control daily sensitivity plot
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


#load pcc results
load(paste(pwcdir, "io/tarray_pwcpccout.RData", sep = ""))
dim(tarray_pwcpccout)
colnames(tarray_pwcpccout) <-colnames(inputdata)
colnames(tarray_pwcpccout) 
ndays <- length(timearray)
date <- 30:ndays
# tarray_pwcpccout<-as.data.frame(t(tarray_pwcpccout))
# tarray_pwcpccout$day<- 1:nrow(tarray_pwcpccout)
# 
# 
# melted_tarray_pwcpccout = melt(tarray_pwcpccout, id.vars="day")
# 
# tarray_pwcpccout$value <- cut(tarray_pwcpccout$value,breaks = c(-Inf,-1:1,Inf),right = FALSE)
# p1 <- ggplot(tarray_pwcpccout, aes(x=variable,
#                        y=day,fill=factor(value))) +
#   geom_tile()+scale_fill_brewer(palette = "Spectral")
# p1
# 
# ggplot.matrix <- function (data = NULL, mapping = aes(), ..., environment = parent.frame()) 
# {
#   d <- reshape2::melt(as.data.frame(data), 1)
#   ggplot(d, mapping, environment = environment)
# }
# 
# ggplot(tarray_pwcpccout, aes(PFAC,value, colour=variable)) + geom_line()
# 





# install.packages("plot3D")
# #install.packages("scatterplot3d")
# library(plot3D)
# #library(scatterplot3d)
# persp3D(z = tarray_pwcpccout, theta = 120)
# install.packages("plotly")
# library(plotly)
# plot_ly(z=tarray_pwcpccout, type="surface")
# 
# #1 or 61
date <- 61:ndays
# date2 <- seq(as.Date("1988/1/1"), as.Date("1991/1/1"), "days")
# date3 <- date2[61:ndays]


#plot control daily sensitivities
pcc_max <- as.data.frame(cbind(date, tarray_pwcpccout[61:ndays,2:dim(tarray_pwcpccout)[2]]))
library(MASS)
library(dplyr)
cont<- pcc_max%>%
  dplyr::select(date,PFAC,uslek,uslels,uslep,CN_c,CN_f,depth,uslec,bd1,bd2,bd3,bd4,bd5,dep,app_rate,koc,aer_aq,temp_ref_aer,
         anae_aq,temp_ref_anae,SOL,benthic_depth,porosity,bulk_density,FROC2,DOC2,BNMAS,SUSED,CHL,FROC1,DOC1,PLMAS)
melted_pwc = melt(cont, id.vars="date")
melted_pwc<- na.omit(melted_pwc)

daily_max_sensitivity <- ggplot(melted_pwc, aes(x=date, y=value, group=variable)) +
  geom_line(aes(colour=melted_pwc$variable)) +facet_wrap(~variable, scale="free")+
  # scale_colour_manual(values = c(
  #   "steelblue", "steelblue","steelblue",       "blue",    "limegreen" ,"firebrick3",   "indianred1",   "deeppink" ,  "gold3",      
  #   #wkrdrnratio,drnmitesurvive,wkrmitesurvive,fgrlifespan,fgrmaxprop,  TotalImmMites pctresistimmmites   InitColNectar,InitColPollen,
  #   
  #   "green",         "tomato"   ,   "tomato"    , "tomato"      , "tomato3"   ,  "tomato3"   ,   "tomato3"  , "steelblue","steelblue", 
  #   #RQQueenStrength, drnadultinfest,drnbroodinfest,drnmiteoffspring,wkradultinfest,wkrbroodinfest,wkrmiteoffspring, adslope,      adLD50
  #   
  #   "palegreen4", "darkgreen", "steelblue", "steelblue",  "darkorange", "blueviolet",
  #   # adslopec    adLD50c     lslope       lLD50             apprate      halflife      
  #   
  #   "steelblue", "steelblue",   "goldenrod","deeppink4", "goldenrod3","steelblue","steelblue", "steelblue",
  #   # cl4pollen    cl4nectar    cl5pollen    cl5nectar       cldpollen       cldnectar      ca13pollen      ca13nectar 
  #   
  #   "gold4",   "steelblue",     "steelblue", "steelblue", "gold",     "steelblue", "gold3",     "deeppink")) + 
  # # ca410pollen  ca410nectar  ca1120pollen ca1120nectar ptrips      ntrips       pload        nload 
  # 
  guides(fill=FALSE) +  
  xlab("Simulation Day") + 
  ylab("Partial Correlation Coefficient") +
  annotate("text", x = 1000, y = 0.92, label = "AveCon H20", size=6) +
  theme_bw() +
  scale_x_discrete(breaks = c(61,426,610,791,1035)) +
  theme(legend.position = "none",  axis.title.x=element_blank(), axis.text.x=element_blank())

daily_max_sensitivity <- ggplot(melted_pwc, aes(x=date, y=value, group=variable)) +
  geom_line(aes(colour=melted_pwc$variable))

pdf(file= paste(pwcdir, "figures/daily_sensitivity.pdf", sep=""), width = 8, height = 6)

p <- ggplot(melted_pwc, aes(factor(variable), value)) 
p + geom_point() + facet_wrap(~variable, scale="free")



dev.off()