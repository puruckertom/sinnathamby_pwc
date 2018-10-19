# pesticide_con<- read.csv("C:/Users/SSinnath/Research/CAVernalPools/vvwm/MALATHIONPYRIFOS/with_observed.csv", header=TRUE, 
#                             sep=",")
#install.packages("rgdal")
library(rgdal)
library(data.table)
library(raster)
library(plyr)
library(dplyr)
library(sf)
#library(ggplot2)
section <- readOGR(dsn = "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced_sections", layer = "Merced_24r")
#head(section)
#names(section) = c("AREA","PERIMETER","PLSNET_","PLSNET_ID","COUNTY_CD","MTOWN","RANGE","SECTION","SOURCE","HYDROAREA","BASIN","REGIONNAME","FRQ_SECNBA","DDLONG","DDLAT","BASE_LN_ME","TOWNSHIP","MTRS","MTR","comtrs","REGION","CO_MTR")
plot(section)
pur_data_all<- read.csv("D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/sec_pesticide_9914.csv", header=TRUE,sep=",")
#head(pur_data_all)
#install.packages("dplyr")

pur_data_all$applic_dt <-as.Date(pur_data_all$applic_dt,"%m/%d/%Y")

# MALATHIONPYRIFOS_app<-filter(pur_data_all,Pesticide=="MALATHIONPYRIFOS")
# MALATHION_WHEAT<-filter(MALATHIONPYRIFOS_app,CROPS=="WHEAT")
#d_WHEAT_2014<-filter(MALATHION_WHEAT,applic_dt=="1/31/2013")
MALATHION_WHEAT_1999<-pur_data_all%>% filter(Pesticide=="MALATHION")%>% 
  filter(CROPS=="WHEAT")%>%
  filter(applic_dt>"1998-12-31" & applic_dt <"2000-01-01")

MALATHION_WHEAT_2000<-pur_data_all%>% filter(Pesticide=="MALATHION")%>% 
  filter(CROPS=="WHEAT")%>%
  filter(applic_dt>"1999-12-31" & applic_dt <"2001-01-01")

MALATHION_WHEAT_2001<-pur_data_all%>% filter(Pesticide=="MALATHION")%>% 
  filter(CROPS=="WHEAT")%>%
  filter(applic_dt>"2000-12-31" & applic_dt <"2002-01-01") 

MALATHION_WHEAT_2002<-pur_data_all%>% filter(Pesticide=="MALATHION")%>% 
  filter(CROPS=="WHEAT")%>%
  filter(applic_dt>"2001-12-31" & applic_dt <"2003-01-01") 

MALATHION_WHEAT_2003<-pur_data_all%>% filter(Pesticide=="MALATHION")%>% 
  filter(CROPS=="WHEAT")%>%
  filter(applic_dt>"2002-12-31" & applic_dt <"2004-01-01")

MALATHION_WHEAT_2004<-pur_data_all%>% filter(Pesticide=="MALATHION")%>% 
  filter(CROPS=="WHEAT")%>%
  filter(applic_dt>"2003-12-31" & applic_dt <"2005-01-01")

MALATHION_WHEAT_2005<-pur_data_all%>% filter(Pesticide=="MALATHION")%>% 
  filter(CROPS=="WHEAT, HUMAN CONSUMPTION")%>%
  filter(applic_dt>"2004-12-31" & applic_dt <"2006-01-01")

MALATHION_WHEAT_2006<-pur_data_all%>% filter(Pesticide=="MALATHION")%>% 
  filter(CROPS=="WHEAT")%>%
  filter(applic_dt>"2005-12-31" & applic_dt <"2007-01-01")

MALATHION_WHEAT_2007<-pur_data_all%>% filter(Pesticide=="MALATHION")%>% 
  filter(CROPS=="WHEAT")%>%
  filter(applic_dt>"2006-12-31" & applic_dt <"2008-01-01")

MALATHION_WHEAT_2008<-pur_data_all%>% filter(Pesticide=="MALATHION")%>% 
  filter(CROPS=="WHEAT")%>%
  filter(applic_dt>"2007-12-31" & applic_dt <"2009-01-01")

MALATHION_WHEAT_2009<-pur_data_all%>% filter(Pesticide=="MALATHION")%>% 
  filter(CROPS=="WHEAT")%>%
  filter(applic_dt>"2008-12-31" & applic_dt <"2010-01-01")

MALATHION_WHEAT_2010<-pur_data_all%>% filter(Pesticide=="MALATHION")%>% 
  filter(CROPS=="WHEAT")%>%
  filter(applic_dt>"2009-12-31" & applic_dt <"2011-01-01")

MALATHION_WHEAT_2011<-pur_data_all%>% filter(Pesticide=="MALATHION")%>% 
  filter(CROPS=="WHEAT")%>%
  filter(applic_dt>"2010-12-31" & applic_dt <"2012-01-01")

MALATHION_WHEAT_2012<-pur_data_all%>% filter(Pesticide=="MALATHION")%>% 
  filter(CROPS=="WHEAT")%>%
  filter(applic_dt>"2011-12-31" & applic_dt <"2013-01-01")

MALATHION_WHEAT_2013<-pur_data_all%>% filter(Pesticide=="MALATHION")%>% 
  filter(CROPS=="WHEAT")%>%
  filter(applic_dt>"2012-12-31" & applic_dt <"2014-01-01")

MALATHION_WHEAT_2014<-pur_data_all%>% filter(Pesticide=="MALATHION")%>% 
  filter(CROPS=="WHEAT")%>%
  filter(applic_dt>"2013-12-31" & applic_dt <"2015-01-01")
# merge on common variable, here called 'key'

require(sp)
#?sp::merge
S_MALATHION_WHEAT_1999 <-merge(section,MALATHION_WHEAT_1999 , by.x = "CO_MTRS", by.y = "comtrs", duplicateGeoms = TRUE)
S_MALATHION_WHEAT_2000 <-merge(section,MALATHION_WHEAT_2000 , by.x = "CO_MTRS", by.y = "comtrs", duplicateGeoms = TRUE)
S_MALATHION_WHEAT_2001 <-merge(section,MALATHION_WHEAT_2001 , by.x = "CO_MTRS", by.y = "comtrs", duplicateGeoms = TRUE)
S_MALATHION_WHEAT_2002 <-merge(section,MALATHION_WHEAT_2002 , by.x = "CO_MTRS", by.y = "comtrs", duplicateGeoms = TRUE)
S_MALATHION_WHEAT_2003 <-merge(section,MALATHION_WHEAT_2003 , by.x = "CO_MTRS", by.y = "comtrs", duplicateGeoms = TRUE)
S_MALATHION_WHEAT_2004 <-merge(section,MALATHION_WHEAT_2004 , by.x = "CO_MTRS", by.y = "comtrs", duplicateGeoms = TRUE)
S_MALATHION_WHEAT_2005 <-merge(section,MALATHION_WHEAT_2005 , by.x = "CO_MTRS", by.y = "comtrs", duplicateGeoms = TRUE)
S_MALATHION_WHEAT_2006 <-merge(section,MALATHION_WHEAT_2006 , by.x = "CO_MTRS", by.y = "comtrs", duplicateGeoms = TRUE)
S_MALATHION_WHEAT_2007 <-merge(section,MALATHION_WHEAT_2007 , by.x = "CO_MTRS", by.y = "comtrs", duplicateGeoms = TRUE)
S_MALATHION_WHEAT_2008 <-merge(section,MALATHION_WHEAT_2008 , by.x = "CO_MTRS", by.y = "comtrs", duplicateGeoms = TRUE)
S_MALATHION_WHEAT_2009 <-merge(section,MALATHION_WHEAT_2009 , by.x = "CO_MTRS", by.y = "comtrs", duplicateGeoms = TRUE)
S_MALATHION_WHEAT_2010 <-merge(section,MALATHION_WHEAT_2010 , by.x = "CO_MTRS", by.y = "comtrs", duplicateGeoms = TRUE)
S_MALATHION_WHEAT_2011 <-merge(section,MALATHION_WHEAT_2011 , by.x = "CO_MTRS", by.y = "comtrs", duplicateGeoms = TRUE)
S_MALATHION_WHEAT_2012 <-merge(section,MALATHION_WHEAT_2012 , by.x = "CO_MTRS", by.y = "comtrs", duplicateGeoms = TRUE)
S_MALATHION_WHEAT_2013 <-merge(section,MALATHION_WHEAT_2013 , by.x = "CO_MTRS", by.y = "comtrs", duplicateGeoms = TRUE)
S_MALATHION_WHEAT_2014 <-merge(section,MALATHION_WHEAT_2014 , by.x = "CO_MTRS", by.y = "comtrs", duplicateGeoms = TRUE)
#names(S_MALATHION_WHEAT_1999)
#save as shapefile
shapefile(S_MALATHION_WHEAT_1999, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/MA_WHEAT_merged1999.shp")
shapefile(S_MALATHION_WHEAT_2000, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/MA_WHEAT_merged2000.shp")
shapefile(S_MALATHION_WHEAT_2001, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/MA_WHEAT_merged2001.shp")
shapefile(S_MALATHION_WHEAT_2002, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/MA_WHEAT_merged2002.shp")
shapefile(S_MALATHION_WHEAT_2003, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/MA_WHEAT_merged2003.shp")
shapefile(S_MALATHION_WHEAT_2004, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/MA_WHEAT_merged2004.shp")
shapefile(S_MALATHION_WHEAT_2005, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/MA_WHEAT_merged2005.shp")
shapefile(S_MALATHION_WHEAT_2006, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/MA_WHEAT_merged2006.shp")
shapefile(S_MALATHION_WHEAT_2007, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/MA_WHEAT_merged2007.shp")
shapefile(S_MALATHION_WHEAT_2008, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/MA_WHEAT_merged2008.shp")
shapefile(S_MALATHION_WHEAT_2009, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/MA_WHEAT_merged2009.shp")
shapefile(S_MALATHION_WHEAT_2010, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/MA_WHEAT_merged2010.shp")
shapefile(S_MALATHION_WHEAT_2011, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/MA_WHEAT_merged2011.shp")
shapefile(S_MALATHION_WHEAT_2012, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/MA_WHEAT_merged2012.shp")
shapefile(S_MALATHION_WHEAT_2013, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/MA_WHEAT_merged2013.shp")
shapefile(S_MALATHION_WHEAT_2014, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced/MA_WHEAT_merged2014.shp")
#plotting

#plot(section, border = 'grey')
#n <- length(S_MALATHION_WHEAT_1999$applic_rate)
#par(mfrow=c(4,4))
plot(S_MALATHION_WHEAT_1999,col=S_MALATHION_WHEAT_1999$applic_rate)
plot(S_MALATHION_WHEAT_2000,col=S_MALATHION_WHEAT_2000$applic_rate)
plot(S_MALATHION_WHEAT_2001,col=S_MALATHION_WHEAT_2001$applic_rate)
plot(S_MALATHION_WHEAT_2002,col=S_MALATHION_WHEAT_2002$applic_rate)
plot(S_MALATHION_WHEAT_2003,col=S_MALATHION_WHEAT_2003$applic_rate)
plot(S_MALATHION_WHEAT_2004,col=S_MALATHION_WHEAT_2004$applic_rate)
plot(S_MALATHION_WHEAT_2005,col=S_MALATHION_WHEAT_2005$applic_rate)
plot(S_MALATHION_WHEAT_2006,col=S_MALATHION_WHEAT_2006$applic_rate)
plot(S_MALATHION_WHEAT_2007,col=S_MALATHION_WHEAT_2007$applic_rate)
plot(S_MALATHION_WHEAT_2008,col=S_MALATHION_WHEAT_2008$applic_rate)
plot(S_MALATHION_WHEAT_2009,col=S_MALATHION_WHEAT_2009$applic_rate)
plot(S_MALATHION_WHEAT_2010,col=S_MALATHION_WHEAT_2010$applic_rate)
plot(S_MALATHION_WHEAT_2011,col=S_MALATHION_WHEAT_2011$applic_rate)
plot(S_MALATHION_WHEAT_2012,col=S_MALATHION_WHEAT_2012$applic_rate)
plot(S_MALATHION_WHEAT_2013,col=S_MALATHION_WHEAT_2013$applic_rate)
plot(S_MALATHION_WHEAT_2014,col=S_MALATHION_WHEAT_2014$applic_rate)
#text(S_MALATHION_WHEAT_1999, S_MALATHION_WHEAT_1999$applic_rate, cex=0.75)

#legend('top',legend=S_MALATHION_WHEAT_1999$applic_rate)
# add a legend to our map



head(S_MALATHION_WHEAT_1999)
install.packages("tmap",dependencies = TRUE)
library(tmap) # load tmap package 
vignette("tmap-nutshell")
data(Europe)
qtm(Europe)
data(World, metro, Europe)
m1 <- tm_shape(Europe) +
  tm_polygons("yellow") +
  tm_facets(along = "name")


qtm(S_MALATHION_WHEAT_1999, "applic_rate") 
plot(S_MALATHION_WHEAT_1999[applic_rate])
# perhaps save as shapefile again
shapefile(S_MALATHION_WHEAT_1999, "D:/Research/GIS Data/CAVernalPools/Pesticides/Merced_sections/S_MALATHION_WHEAT_1999.shp")