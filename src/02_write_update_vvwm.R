con <- file(paste(pwcdir, "input/przm/vvwmTransfer",".txt",sep=""))
l_old=readLines(con)
l=readLines(con)
close(con)

#############################################################
koc=runif(Nsims, min=0.95, max=1.05)
koc_list <- unlist(strsplit(l[5],","))
koc_list[1]<-round((koc[Ite]*(as.numeric(koc_list[1]))),1)
l[5]=paste(koc_list,collapse=",")

##########################################################
aer_aq=runif(Nsims, min=0.95, max=1.05)
aer_aq_list <- unlist(strsplit(l[6],","))
aer_aq_list[1]<-round((aer_aq[Ite]*(as.numeric(aer_aq_list[1]))),1)
l[6]=paste(aer_aq_list,collapse=",")
##################################################################################
temp_ref_aer=runif(Nsims, min=0.95, max=1.05)
temp_ref_aer_list <- unlist(strsplit(l[7],","))
temp_ref_aer_list[1]<-round((temp_ref_aer[Ite]*(as.numeric(temp_ref_aer_list[1]))),1)
l[7]=paste(temp_ref_aer_list,collapse=",")
######################################################################################
anae_aq=runif(Nsims, min=0.95, max=1.05)
anae_aq_list <- unlist(strsplit(l[8],","))
anae_aq_list[1]<-round((anae_aq[Ite]*(as.numeric(anae_aq_list[1]))),1)
l[8]=paste(anae_aq_list,collapse=",")
#####################################################################################
temp_ref_anae=runif(Nsims, min=0.95, max=1.05)
temp_ref_anae_list <- unlist(strsplit(l[9],","))
temp_ref_anae_list[1]<-round((temp_ref_anae[Ite]*(as.numeric(temp_ref_anae_list[1]))),1)
l[9]=paste(temp_ref_anae_list,collapse=",")
#################################################################################
photo=runif(Nsims, min=0.90, max=1.10)
photo_list <- unlist(strsplit(l[10],","))
photo_list[1]<-round((photo[Ite]*(as.numeric(photo_list[1]))),1)
l[10]=paste(photo_list,collapse=",")
################
RFLAT=runif(Nsims, min=-5, max=5)
RFLAT_list <- unlist(strsplit(l[11],","))
RFLAT_list[1]<-(RFLAT[Ite]+(as.numeric(RFLAT_list[1])))
l[11]=paste(RFLAT_list,collapse=",")
################################################################################
hydro=runif(Nsims, min=0.90, max=1.10)
hydro_list <- unlist(strsplit(l[12],","))
hydro_list[1]<-round((hydro[Ite]*(as.numeric(hydro_list[1]))),2)
l[12]=paste(hydro_list,collapse=",")
#############################################################################
SOL=runif(Nsims, min=0.95, max=1.05)
SOL_list <- unlist(strsplit(l[18],","))
SOL_list[1]<-round((SOL[Ite]*(as.numeric(SOL_list[1]))),1)
l[18]=paste(SOL_list,collapse=",")
##############################################################################
benthic_depth=round(runif(Nsims, min=0.25, max=1),2)
l[41]=paste(benthic_depth[Ite])
##########################
porosity=round(runif(Nsims, min=0.1, max=1),2)
l[42]=paste(porosity[Ite])
###########################################################################
bulk_density=round(runif(Nsims, min=1, max=2),2)
l[43]=paste(bulk_density[Ite])
###########################################################################
FROC2=runif(Nsims, min=0.90, max=1.10)#Fraction of organic carbon on sediment in benthic region.
FROC2_a<-round((FROC2[Ite]*(as.numeric(l[44]))),2)
l[44]=paste(FROC2_a)
###########################################################################
DOC2=round(runif(Nsims, min=0.95, max=1.05),2)#Concentration of dissolved organic carbon in benthic region (mg/L)
DOC2_a<-round((DOC2[Ite]*(as.numeric(l[45]))),2)
l[45]=paste(DOC2_a)
###########################################################################
BNMAS=runif(Nsims, min=0.90, max=1.10)#Areal concentration of biosolids in benthic region (g/m2)
BNMAS_a<-round((BNMAS[Ite]*(as.numeric(l[46]))),3)
l[46]=paste(BNMAS_a)
###########################################################################
SUSED=runif(Nsims, min=0.90, max=1.10)#Suspended solids concentration in water column (mg/L)
SUSED_a<-round((SUSED[Ite]*(as.numeric(l[48]))),2)
l[48]=paste(SUSED_a)
###########################################################################
CHL=runif(Nsims, min=0.90, max=1.10)#Chlorophyll concentration in water column (mg/L)
CHL_a<-round((CHL[Ite]*(as.numeric(l[49]))),3)
l[49]=paste(CHL_a)
###########################################################################
FROC1=runif(Nsims, min=0.95, max=1.05)#Fraction of organic carbon on suspended sediment in water column.
FROC1_a<-round((FROC1[Ite]*(as.numeric(l[50]))),3)
l[50]=paste(FROC1_a)
###########################################################################
DOC1=runif(Nsims, min=0.95, max=1.05)#Concentration of dissolved organic carbon in water column (mg/L)
DOC1_a<-round((DOC1[Ite]*(as.numeric(l[51]))),1)
l[51]=paste(DOC1_a)
###########################################################################
PLMAS=runif(Nsims, min=0.90, max=1.10)#Concentration of biosolids in water column (mg/L)
PLMAS_a<-round((PLMAS[Ite]*(as.numeric(l[52]))),2)
l[52]=paste(PLMAS_a)
###########################################################################

l[1]=paste(file_path_as_absolute(newdir),"/","output", sep="")
l[30]=paste(file_path_as_absolute(newdir),"/",pwc_weather_used, sep="")
l[69]=paste("\"",file_path_as_absolute(newdir),"/","output_CAalmond_WirrigSTD_Custom_Parent_daily.csv","\"", sep="")#
l[70]=paste("\"",file_path_as_absolute(newdir),"/","output_CAalmond_WirrigSTD_Custom_Degradate1_daily.csv","\"", sep="")#
l[71]=paste("\"",file_path_as_absolute(newdir),"/","output_CAalmond_WirrigSTD_Custom_Degradate2_daily.csv","\"", sep="")#
l[72]=paste("\"",file_path_as_absolute(newdir),"/","output_CAalmond_WirrigSTD_Custom_Parent.txt","\"", sep="")#
l[73]=paste("\"",file_path_as_absolute(newdir),"/","output_CAalmond_WirrigSTD_Custom_Degradate1.txt","\"", sep="")#
l[74]=paste("\"",file_path_as_absolute(newdir),"/","output_CAalmond_WirrigSTD_Custom_Degradate2.txt","\"", sep="")#
l[75]=paste("\"",file_path_as_absolute(newdir),"/","output_CAalmond_WirrigSTD_Custom_Parent_DEEM.rdf","\"", sep="")#
l[76]=paste("\"",file_path_as_absolute(newdir),"/","output_CAalmond_WirrigSTD_Custom_Degradate1_DEEM.rdf","\"", sep="")#
l[77]=paste("\"",file_path_as_absolute(newdir),"/","output_CAalmond_WirrigSTD_Custom_Degradate2_DEEM.rdf","\"", sep="")#
l[78]=paste("\"",file_path_as_absolute(newdir),"/","output_CAalmond_WirrigSTD_Custom_Parent_Calendex.rdf","\"", sep="")#
l[79]=paste("\"",file_path_as_absolute(newdir),"/","output_CAalmond_WirrigSTD_Custom_Degradate1_Calendex.rdf","\"", sep="")#
l[80]=paste("\"",file_path_as_absolute(newdir),"/","output_CAalmond_WirrigSTD_Custom_Degradate2_Calendex.rdf","\"", sep="")#
l[81]=paste("\"",file_path_as_absolute(newdir),"/","output_CAalmond_WirrigSTD_Custom_15_Parent.txt","\"", sep="")#
l[82]=paste("\"",file_path_as_absolute(newdir),"/","output_CAalmond_WirrigSTD_Custom_15_Degradate1.txt","\"", sep="")#
l[83]=paste("\"",file_path_as_absolute(newdir),"/","output_CAalmond_WirrigSTD_Custom_15_Degradate2.txt","\"", sep="")#

vvwm_file <- paste("vvwmTransfer",".txt", sep="")
file.exists(vvwm_file)
file.create(vvwm_file)
file.exists(vvwm_file)
con_vvwm <-file(vvwm_file)
writeLines(l, 
           con_vvwm)
close(con_vvwm)
