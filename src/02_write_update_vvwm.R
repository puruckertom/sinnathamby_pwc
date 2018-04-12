con <- file(paste(pwcdir, "input/przm/vvwmTransfer",".txt",sep=""))
l_old=readLines(con)
l=readLines(con)
close(con)

#############################################################
koc=runif(Nsims, min=600, max=1000)#Sorption coefficient (mL/g)
koc_list <- unlist(strsplit(l[5],","))
koc_list[1]<-koc[Ite]
l[5]=paste(koc_list,collapse=",")

##########################################################
aer_aq=runif(Nsims, min=5, max=35)#Water column degradation half-life (days)
aer_aq_list <- unlist(strsplit(l[6],","))
aer_aq_list[1]<-aer_aq[Ite]
l[6]=paste(aer_aq_list,collapse=",")
##################################################################################
temp_ref_aer=runif(Nsims, min=5, max=35)#Reference temperature for water column degradation
temp_ref_aer_list <- unlist(strsplit(l[7],","))
temp_ref_aer_list[1]<-temp_ref_aer[Ite]
l[7]=paste(temp_ref_aer_list,collapse=",")
######################################################################################
anae_aq=runif(Nsims, min=5, max=150)#Benthic degradation half-life (days)
anae_aq_list <- unlist(strsplit(l[8],","))
anae_aq_list[1]<-anae_aq[Ite]
l[8]=paste(anae_aq_list,collapse=",")
#####################################################################################
temp_ref_anae=runif(Nsims, min=5, max=35)#Reference temperature for benthic degradation;
temp_ref_anae_list <- unlist(strsplit(l[9],","))
temp_ref_anae_list[1]<-temp_ref_anae[Ite]
l[9]=paste(temp_ref_anae_list,collapse=",")
#################################################################################
# photo=round(runif(Nsims, min=0.1, max=25),1)#Diazinon was stable to aqueous photolysis and acceptable soil photolysis data are not available
# photo_list <- unlist(strsplit(l[10],","))
# photo_list[1]<-photo[Ite]
# l[10]=paste(photo_list,collapse=",")
################
# RFLAT=runif(Nsims, min=5, max=45)#Reference latitude for photolysis
# RFLAT_list <- unlist(strsplit(l[11],","))
# RFLAT_list[1]<-RFLAT[Ite]
# l[11]=paste(RFLAT_list,collapse=",")
################################################################################
# hydro=round(runif(Nsims, min=0.1, max=50),1)#Hydrolysis half-life (days); Stable
# hydro_list <- unlist(strsplit(l[12],","))
# hydro_list[1]<-hydro[Ite]
# l[12]=paste(hydro_list,collapse=",")
#############################################################################
SOL=round(runif(Nsims, min=0.1, max=90),1)#Solubility (mg/L)
SOL_list <- unlist(strsplit(l[18],","))
SOL_list[1]<-SOL[Ite]
l[18]=paste(SOL_list,collapse=",")
##############################################################################
benthic_depth=round(runif(Nsims, min=0.01, max=1),2)#Depth of benthic region (m)
l[41]=paste(benthic_depth[Ite])
##########################
porosity=round(runif(Nsims, min=0.1, max=0.8),2)
l[42]=paste(porosity[Ite])
###########################################################################
bulk_density=round(runif(Nsims, min=1.4, max=1.7),2)
l[43]=paste(bulk_density[Ite])
###########################################################################
FROC2=round(runif(Nsims, min=0.01, max=0.99),2)#Fraction of organic carbon on sediment in benthic region.
FROC2_a<-FROC2[Ite]
l[44]=paste(FROC2_a)
###########################################################################
DOC2=round(runif(Nsims, min=0.01, max=60),2)#Concentration of dissolved organic carbon in benthic region (mg/L)
DOC2_a<-DOC2[Ite]
l[45]=paste(DOC2_a)
###########################################################################
BNMAS=round(runif(Nsims, min=0.001, max=5),3)#Areal concentration of biosolids in benthic region (g/m2)
BNMAS_a<-BNMAS[Ite]
l[46]=paste(BNMAS_a)
###########################################################################
SUSED=runif(Nsims, min=1, max=80)#Suspended solids concentration in water column (mg/L)
SUSED_a<-SUSED[Ite]
l[48]=paste(SUSED_a)
###########################################################################
CHL=round(runif(Nsims, min=0.001, max=1.5),3)#Chlorophyll concentration in water column (mg/L)
CHL_a<-CHL[Ite]
l[49]=paste(CHL_a)
###########################################################################
FROC1=round(runif(Nsims, min=0.01, max=1),2)#Fraction of organic carbon on suspended sediment in water column.
FROC1_a<-FROC1[Ite]
l[50]=paste(FROC1_a)
###########################################################################
DOC1=round(runif(Nsims, min=0.1, max=15),1)#Concentration of dissolved organic carbon in water column (mg/L)
DOC1_a<-DOC1[Ite]
l[51]=paste(DOC1_a)
###########################################################################
PLMAS=round(runif(Nsims, min=0.001, max=10),2)#Concentration of biosolids in water column (mg/L)
PLMAS_a<-PLMAS[Ite]
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
