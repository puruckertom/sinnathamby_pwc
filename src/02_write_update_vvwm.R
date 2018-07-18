con <- file(paste(pwcdir, "input/przm/vvwmTransfer",".txt",sep=""))
l_old=readLines(con)
l=readLines(con)
close(con)

#############################################################
koc=input_list[Ite,"koc"]
koc_list <- unlist(strsplit(l[5],","))
koc_list[1]<-koc
l[5]=paste(koc_list,collapse=",")

##########################################################
aer_aq=input_list[Ite,"aer_aq"]
aer_aq_list <- unlist(strsplit(l[6],","))
aer_aq_list[1]<-aer_aq
l[6]=paste(aer_aq_list,collapse=",")
##################################################################################
temp_ref_aer=input_list[Ite,"temp_ref_aer"]
temp_ref_aer_list <- unlist(strsplit(l[7],","))
temp_ref_aer_list[1]<-temp_ref_aer
l[7]=paste(temp_ref_aer_list,collapse=",")
######################################################################################
anae_aq=input_list[Ite,"anae_aq"]
anae_aq_list <- unlist(strsplit(l[8],","))
anae_aq_list[1]<-anae_aq
l[8]=paste(anae_aq_list,collapse=",")
#####################################################################################
temp_ref_anae=input_list[Ite,"temp_ref_anae"]
temp_ref_anae_list <- unlist(strsplit(l[9],","))
temp_ref_anae_list[1]<-temp_ref_anae
l[9]=paste(temp_ref_anae_list,collapse=",")
#################################################################################
photo=input_list[Ite,"photo"]
photo_list <- unlist(strsplit(l[10],","))
photo_list[1]<-photo
l[10]=paste(photo_list,collapse=",")
###############
RFLAT=input_list[Ite,"RFLAT"]
RFLAT_list <- unlist(strsplit(l[11],","))
RFLAT_list[1]<-RFLAT
l[11]=paste(RFLAT_list,collapse=",")
###############################################################################
hydro=input_list[Ite,"hydro"]
hydro_list <- unlist(strsplit(l[12],","))
hydro_list[1]<-hydro
l[12]=paste(hydro_list,collapse=",")
#############################################################################
SOL=input_list[Ite,"SOL"]
SOL_list <- unlist(strsplit(l[18],","))
SOL_list[1]<-SOL
l[18]=paste(SOL_list,collapse=",")
##############################################################################
benthic_depth=input_list[Ite,"benthic_depth"]
l[41]=paste(benthic_depth)
##########################
porosity=input_list[Ite,"porosity"]
l[42]=paste(porosity)
###########################################################################
bulk_density=input_list[Ite,"bulk_density"]
l[43]=paste(bulk_density)
###########################################################################
FROC2=input_list[Ite,"FROC2"]
FROC2_a<-FROC2
l[44]=paste(FROC2_a)
###########################################################################
DOC2=input_list[Ite,"DOC2"]
DOC2_a<-DOC2
l[45]=paste(DOC2_a)
###########################################################################
BNMAS=input_list[Ite,"BNMAS"]
BNMAS_a<-BNMAS
l[46]=paste(BNMAS_a)
###########################################################################
SUSED=input_list[Ite,"SUSED"]
SUSED_a<-SUSED
l[48]=paste(SUSED_a)
###########################################################################
CHL=input_list[Ite,"CHL"]
CHL_a<-CHL
l[49]=paste(CHL_a)
###########################################################################
FROC1=input_list[Ite,"FROC1"]
FROC1_a<-FROC1
l[50]=paste(FROC1_a)
###########################################################################
DOC1=input_list[Ite,"DOC1"]
DOC1_a<-DOC1
l[51]=paste(DOC1_a)
###########################################################################
PLMAS=input_list[Ite,"PLMAS"]
PLMAS_a<-PLMAS
l[52]=paste(PLMAS_a)
###########################################################################
depth_0=input_list[Ite,"depth_0"]
depth_0_a<-depth_0
l[61]=paste(depth_0_a)
#############################################################################
depth_max=input_list[Ite,"depth_max"]
depth_max_a<-depth_max
l[62]=paste(depth_max_a)
################################################################################
bf=input_list[Ite,"bf"]#baseflow
l[65]=paste(bf)
###############################################################################
cf=input_list[Ite,"cf"]#cropped fraction
l[66]=paste(cf)
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
