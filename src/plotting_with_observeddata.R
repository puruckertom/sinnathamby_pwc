#install.packages("rgdal")
#install.packages("dplyr")
library(rgdal)
library(data.table)
library(raster)
library(plyr)
library(dplyr)
library(sf)
library(ggplot2)
#PUR SURF data

pur_diazinon<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/Pesticidedata/surfdata/SURF Water Table, Updated August 9, 2017 (Final)/merced_diazinon_pur_2017.csv", header=TRUE,sep=",")
#head(pur_data_all)


pur_diazinon$SAMPLE.DATE <-as.Date(pur_diazinon$SAMPLE.DATE,"%m/%d/%Y")

ggplot(pur_diazinon, aes(x=pur_diazinon$SAMPLE.DATE, y=pur_diazinon$CONCENTRATION..ppb.)) +
geom_point()
plot(pur_diazinon$SAMPLE.DATE,pur_diazinon$CONCENTRATION..ppb.,log="y",type='p',lty=2,col = "red",xlab="Year", ylab="Diazinon Concentration (ug/l)",bty = "n",ylim=c(0.0001,1000))#,,yaxt = "n",ylim=c(0.001,0.9)

  
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
  diazinon_w <- DiazinonData %>%
    filter(ResultMeasure.MeasureUnitCode %in% c("ug/l")) %>%
    # group_by(MonitoringLocationIdentifier) %>%
    # summarise(count=n(),
    #           start=min(ActivityStartDateTime),
    #           end=max(ActivityStartDateTime),
    #           max = max(ResultMeasureValue, na.rm = TRUE)) %>%
    filter(ActivityMediaName %in% c("Water")) %>%
    filter(ActivityStartDate >"1998-12-31" & ActivityStartDate  <"2015-01-01") %>%
    arrange(ActivityStartTime.Time) %>%
    left_join( DiazinonSites, by = "MonitoringLocationIdentifier")%>%
    filter(CountyCode %in% c("047"))
  
  
  diazinon_sed <- DiazinonData %>%
    filter(ResultMeasure.MeasureUnitCode %in% c("ug/kg")) %>%
    # group_by(MonitoringLocationIdentifier) %>%
    # summarise(count=n(),
    #           start=min(ActivityStartDateTime),
    #           end=max(ActivityStartDateTime),
    #           max = max(ResultMeasureValue, na.rm = TRUE)) %>%
    filter(ActivityMediaName %in% c("Sediment")) %>%
    filter(ActivityStartDate >"1998-12-31" & ActivityStartDate  <"2015-01-01") %>%
    arrange(ActivityStartTime.Time) %>%
    left_join( DiazinonSites, by = "MonitoringLocationIdentifier")%>%
    filter(CountyCode %in% c("047"))
  # write.table(diazinon_w, "C:/Users/SSinnath/Research/CAVernalPools/Pesticidedata/NWS/Diazinon_merced.txt",sep="\t")
  # count(diazinon_w)
  # #plotting
  # col_types <- c("darkblue","dodgerblue","green4","gold1","orange","brown","red")
  # leg_vals <- unique(as.numeric(quantile(diazinon_w$ResultMeasureValue, 
  #                                        probs=c(0,0.01,0.1,0.25,0.5,0.75,0.9,.99,1), na.rm=TRUE)))
  # pal = colorBin(col_types, diazinon_w$ResultMeasureValue, bins = leg_vals)
  # rad <-3*seq(1,4,length.out = 16)
  # diazinon_w$sizes <- rad[as.numeric(cut(4093, breaks=16))]
  
  
  
  
  # ggplot(diazinon_w, aes(x=diazinon_w$ActivityStartDate, y=diazinon_w$ResultMeasureValue)) +
  #   geom_point() 
  # ggplot(pur_diazinon, aes(x=pur_diazinon$SAMPLE.DATE, y=pur_diazinon$CONCENTRATION..ppb.)) +
  #   geom_point()
  
  almond_w1<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/vvwm/diazinon/watershed1/almond1.csv", header=TRUE,sep=",")
  #head(pur_data_all) 
  almond_w1$Date <-as.Date(almond_w1$Date,"%m/%d/%Y")
dia_w2<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/vvwm/diazinon/watershed2/diazinon_w2.csv", header=TRUE,sep=",")
  #head(pur_data_all) 
dia_w2$Date <-as.Date(dia_w2$Date,"%m/%d/%Y")
dia_w3<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/vvwm/diazinon/watershed3/diazinon_w3.csv", header=TRUE,sep=",")
#head(pur_data_all) 
dia_w3$Date <-as.Date(dia_w3$Date,"%m/%d/%Y")  
  # ggplot()+
  #   geom_point(data=diazinon_w, aes(x=diazinon_w$ActivityStartDate, y=diazinon_w$ResultMeasureValue),color='green', size = 4,show.legend = TRUE,alpha=0.5)+
  #   geom_point(data=pur_diazinon, aes(x=pur_diazinon$SAMPLE.DATE, y=pur_diazinon$CONCENTRATION..ppb.),color='red', size = 3,show.legend = TRUE,alpha=0.5)+
  #   geom_line(data=almond_w1, aes(x=almond_w1$Date, y=almond_w1$Con),color='blue')+
  #   geom_line(data=dia_w2, aes(x=dia_w2$Date, y=dia_w2$con),color='black')
  #   scale_y_continuous(limits = c(0, 100))+
  #   theme_classic()+labs(title = "", x = "", y = "Diazinon Concentration")+ 
  #   theme(axis.title.x = element_text(colour="black", size=14),axis.text.x  = element_text(colour="black", vjust=0.5, size=14))+ theme(axis.title.y = element_text(colour="black", size=14),axis.text.y  = element_text(vjust=0.5, size=14,colour="black" ))+
  #   theme(legend.text=element_text(size=12))
diazinon_w$ActivityStartDate <-as.Date(diazinon_w$ActivityStartDate,"%m/%d/%Y")
options(scipen=999)
plot(pur_diazinon$SAMPLE.DATE,pur_diazinon$CONCENTRATION..ppb.,log="y",type='p',lty=2,col =alpha( "black",0.5),xlab="Year", ylab="Diazinon Concentration (ug/l)",bty = "n",ylim=c(0.00001,100))#,ylim=c(0.00001,1000)#,,yaxt = "n"
points(diazinon_w$ActivityStartDate,diazinon_w$ResultMeasureValue,log="y",type='p',pch=3,col =alpha( "blue",0.2))
points(almond_w1$Date,almond_w1$Con,log="y",type='p',pch=1,col = "darkblue",cex = .1)
points(dia_w2$Date,dia_w2$con,log="y",type='p',pch=1,col = "orange",cex = .1)
points(dia_w3$Date,dia_w3$con,log="y",type='p',pch=1,col = "red",cex = .1)

legend("bottom", legend=c("CADPR", "NAWQA","Watershed 1","Watershed 2","Watershed 3"),
       col=c("black", "blue","darkblue","orange","red"), lty=c(2,NA,NA,NA,NA), bty = "n",pch=c(NA, 3,1,1,1),cex=1,ncol=3,bg="transparent")


    
# legend("bottom", legend=c("CADPR", "NAWQA","Watershed 1","Watershed 2","Watershed 3"),
#        col=c("black", "blue","darkblue","orange","red"), lty=c(2,2,NA,NA,NA), bty = "n",pch=c(NA, NA,1,5,5),cex=1,ncol=3,bg="transparent")
# 

    
    # 
    # options(scipen=999)
    # plot(pur_diazinon$SAMPLE.DATE,pur_diazinon$CONCENTRATION..ppb.,log="y",type='p',lty=2,col =alpha( "black",0.2),xlab="Year", ylab="Diazinon Concentration (ug/l)",bty = "n")#,ylim=c(0.00001,1000)#,,yaxt = "n",ylim=c(0.001,0.9)
    # points(diazinon_w$ActivityStartDate,diazinon_w$ResultMeasureValue,log="y",type='p',lty=2,col =alpha("blue",0.2))
    # 
    # lines(almond_w1$Date,almond_w1$Con,log="y",type='l',pch=1,col = "red")
    # lines(dia_w2$Date,dia_w2$con,log="y",type='l',pch=5,col = "darkgreen",cex = .5)
    # lines(dia_w3$Date,dia_w3$con,log="y",type='l',pch=5,col = "orange",cex = .5) 
    
    legend("topright", legend=c("Watershed 1", "Watershed 2","Watershed 3","Measured Stream/ river concentration","San Luis NWR KST62","San Luis NWR KST63","San Luis NWR KST70" ),
           col=c("red", "blue","darkgreen","black","darkblue","orange","darkgreen"), lty=c(1,2,3,NA,NA, NA, NA), bty = "n",pch=c(NA, NA, NA,15,16,17,18),cex=0.8,ncol=2,bg="transparent")
    
    
    
 # a<-diazinon_w$ResultMeasureValue
  a<-pur_diazinon$CONCENTRATION..ppb.
  b<-almond_w1$Con
  c<-dia_w2$con
  d<-dia_w3$con
  boxplot(a,at=1,xlim=c(0, 6))#, ,ylim=c(0, 6)
  boxplot(b, at=2, add=TRUE)
  boxplot(c, at=3, add=TRUE)
  boxplot(d, at=4, add=TRUE)
  
  
  
  ggplot()+
    geom_line(data=diazinon_w, aes(x=diazinon_w$ActivityStartDate, y=diazinon_w$ResultMeasureValue),color='green')+
    geom_line(data=pur_diazinon, aes(x=pur_diazinon$SAMPLE.DATE, y=pur_diazinon$CONCENTRATION..ppb.),color='red')+
    geom_line(data=almond_w1, aes(x=almond_w1$Date, y=almond_w1$Con),color='blue')+
    geom_line(data=dia_w2, aes(x=dia_w2$Date, y=dia_w2$con),color='black')+
    scale_y_continuous(limits = c(0, 25))+
    theme_classic()+labs(title = "", x = "", y = "Diazinon Concentration")+ 
    theme(axis.title.x = element_text(colour="black", size=14),axis.text.x  = element_text(colour="black", vjust=0.5, size=14))+ theme(axis.title.y = element_text(colour="black", size=14),axis.text.y  = element_text(vjust=0.5, size=14,colour="black" ))+
    theme(legend.text=element_text(size=12))
  
  ###########################################################################################################
  ############################################################################################################
  #vignette("dataRetrieval",package = "dataRetrieval")
  ##The following function returns sites that have collected phosphorus data in Kansas. There's no way to know if that site has collected one sample, or thousands.
  chlorSites <- whatWQPsites(statecode="CA",characteristicName="Chlorpyrifos")
  ## So, to get that information, you need to actually get that data.
  chlorData <- readWQPdata(statecode="CA",characteristicName="Chlorpyrifos")
  unique(chlorData$ResultMeasure.MeasureUnitCode)
  unique(chlorData$ActivityMediaName)
  chlorData$ActivityStartDate <-as.Date(chlorData$ActivityStartDate,"%m/%d/%Y")
  
  
  chlor_w <- chlorData %>%
    filter(ResultMeasure.MeasureUnitCode %in% c("ug/l")) %>%
    # group_by(MonitoringLocationIdentifier) %>%
    # summarise(count=n(),
    #           start=min(ActivityStartDateTime),
    #           end=max(ActivityStartDateTime),
    #           max = max(ResultMeasureValue, na.rm = TRUE)) %>%
    filter(ActivityMediaName %in% c("Water")) %>%
    #filter(CountyCode %in% c("047")) %>%
    filter(ActivityStartDate >"1998-12-31" & ActivityStartDate  <"2015-01-01") %>%
    arrange(ActivityStartTime.Time) %>%
    left_join( chlorSites, by = "MonitoringLocationIdentifier")
  count(chlor_w)
  #
  
  write.table(chlor_w, "C:/Users/SSinnath/Research/CAVernalPools/Pesticidedata/NWS/chlor.txt",sep="\t")
  #write.table(DiazinonSites, "C:/Users/SSinnath/Research/CAVernalPools/Pesticidedata/NWS/Diazinonsite.txt",sep="\t")
  leaflet(data=diazinon_w) %>% 
    addProviderTiles("CartoDB.Positron") %>%
    addCircleMarkers(~dec_lon_va,~dec_lat_va,
                     fillColor = ~pal(ResultMeasureValue),
                     radius = ~sizes,
                     fillOpacity = 0.8, opacity = 0.8,stroke=FALSE,
                     popup=~station_nm) %>%
    addLegend(position = 'bottomleft',
              pal=pal,
              values=~ResultMeasureValue,
              opacity = 0.8,
              labFormat = labelFormat(digits = 1), 
              title = 'Max Value')
  
  
  pur_chlor<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/Pesticidedata/surfdata/SURF Water Table, Updated August 9, 2017 (Final)/cholr_merced_1999_2014.csv", header=TRUE,sep=",")
  #head(pur_data_all)
 nws_chlor<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/Pesticidedata/NWS/chlor_merced.csv", header=TRUE,sep=",")
  #head(pur_data_all)
  pur_chlor$SAMPLE.DATE <-as.Date(pur_chlor$SAMPLE.DATE,"%m/%d/%Y")
  nws_chlor$ActivityStartDate <-as.Date(nws_chlor$ActivityStartDate,"%m/%d/%Y")
  chlor_w1<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/vvwm/chlorpyrifos/watershed1/chlor1.csv", header=TRUE,sep=",")
  #head(pur_data_all) 
  chlor_w1$Date <-as.Date(chlor_w1$Date,"%m/%d/%Y")
  chlor_w2<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/vvwm/chlorpyrifos/watershed2/chlor2.csv", header=TRUE,sep=",")
  #head(pur_data_all) 
  chlor_w2$Date <-as.Date(chlor_w2$Date,"%m/%d/%Y")
  chlor_w3<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/vvwm/chlorpyrifos/watershed3/chlor3.csv", header=TRUE,sep=",")
  #head(pur_data_all) 
  chlor_w3$Date <-as.Date(chlor_w3$Date,"%m/%d/%Y")  
  ggplot(pur_chlor, aes(x=pur_chlor$SAMPLE.DATE, y=pur_chlor$CONCENTRATION..ppb.)) +
    geom_point()
  ggplot(nws_chlor, aes(x=nws_chlor$ActivityStartDate, y=nws_chlor$ResultMeasureValue)) +
    geom_point()
  options(scipen=999)
  plot(pur_chlor$SAMPLE.DATE,pur_chlor$CONCENTRATION..ppb.,log="y",type='p',lty=2,col =alpha("black",0.2),xlab="Year", ylab="Chlorpyrifos Concentration (ug/l)",bty = "n",ylim=c(0.0001,100))##,,yaxt = "n",ylim=c(0.001,0.9)
  #points(nws_chlor$ActivityStartDate,nws_chlor$ResultMeasureValue,log="y",type='p',lty=2,col =alpha("blue",0.2))
  #plot(nws_chlor$ActivityStartDate,nws_chlor$ResultMeasureValue,log="y",type='p',lty=2,col =alpha( "black",0.2),xlab="Year", ylab="Chlorpyrifos Concentration (ug/l)",bty = "n",ylim=c(0.0001,100))##
  points(nws_chlor$ActivityStartDate,nws_chlor$ResultMeasureValue,log="y",type='p',pch=3,col =alpha( "blue",0.2))
  points(chlor_w1$Date,chlor_w1$Con,log="y",type='p',pch=1,col = "darkblue",cex = .1)
  points(chlor_w2$Date,chlor_w2$Con,log="y",type='p',pch=1,col = "orange",cex = .1)
  points(chlor_w3$Date,chlor_w3$Con,log="y",type='p',pch=1,col = "red",cex = .1)
  legend("bottom", legend=c("CADPR", "NAWQA","Watershed 1","Watershed 2","Watershed 3"),
         col=c("black", "blue","darkblue","orange","red"), lty=c(2,NA,NA,NA,NA), bty = "n",pch=c(NA, 3,1,1,1),cex=1,ncol=3,bg="transparent")
  
 