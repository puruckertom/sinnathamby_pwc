#Create empty dataframe for outputs
##############PRZM###########################################
df <- read.table(paste(pwcdir,"output/output",".zts", sep=""), header= FALSE, sep= "",
                 skip = 3, stringsAsFactors = FALSE, row.names=NULL)
dim(df)
str(df)
nrows <- dim(df)[[1]] 
ncols <- dim(df)[[2]]
outputdf <- array(data=NA, c(nrows,ncols,Nsims))

#############PWC#########################################
pwcdf <- read.csv(paste(pwcdir,"output/output_CAalmond_WirrigSTD_Custom_Parent_daily.csv", sep=""), header= FALSE, sep= ",",
                  skip = 5, stringsAsFactors = FALSE, row.names=NULL)
dim(pwcdf)
str(pwcdf)
nrows <- dim(pwcdf)[[1]]
ncols <- dim(pwcdf)[[2]]
pwcoutdf <- array(data=NA, c(nrows,ncols,Nsims))
######################################################
con_fac <- data.frame(matrix(ncol = 1, nrow = Nsims))
dim(con_fac)
###############update input file################
for (Ite in 1:Nsims){
  print(Ite)
  con <- file(paste(pwcdir, "input/przm/PRZM5",".inp",sep=""))
  a_old=readLines(con)
  a=readLines(con)
###########update parameter##########################################################################
  a[4]="C:\\git\\sinnathamby_pwc\\output\\20737_grid.wea"
 
  a[6]="C:\\git\\sinnathamby_pwc\\output\\przm\\output.zts"
 
  ############################################################################################################
  ######Pan factor##############
  PFAC=runif(Nsims, min=0.70, max=0.80);
  a[10]=paste(sprintf("%.02f", PFAC[Ite]),substr(a[10],5,16), sep="")
  #####USLEK#######################
  # Soils high in clay have low K values, about 0.05 to 0.15, because
  # they resistant to detachment. Coarse textured soils, such as sandy soils,
  # have low K values, about 0.05 to 0.2, because of low runoff even though
  # these soils are easily detached. Medium textured soils, such as the silt loam soils,
  # have a moderate K values, about 0.25 to 0.4, because they are moderately susceptible
  # to detachment and they produce moderate runoff. Soils having a high silt content are
  # most erodible of all soils. They are easily detached; tend to crust and produce high rates
  # of runoff. Values of K for these soils tend to be greater than 0.4.
  uslek=runif(Nsims, min=0.4, max=0.65); #soil erodibility factor
  a[14]=paste(sprintf("%.02f", uslek[Ite]),substr(a[14],5,34), sep="")
  #############uslels slope length factor, representing the effect of slope length on erosion########################################
  uslels=round(runif(Nsims, min=0.01, max=1),2)
  uslels_list <- unlist(strsplit(a[14],","))
  uslels_list[2]<-uslels[Ite]
  a[14]=paste(uslels_list,collapse=",")
  #############uslep############################################################################################
  uslep=round(runif(Nsims, min=0.01, max=1),2)
  uslep_list <- unlist(strsplit(a[14],","))
  uslep_list[3]<-uslep[Ite]
  a[14]=paste(uslep_list,collapse=",")
  #############CN###############################################################################################
  # Num=24#Number of hydro-event changes
  # CN=round(runif(Nsims, min=82, max=89),0)
  # 
  # 
  # row_0=18
  # for (i in 1:Num){
  #   row_t=row_0+(i-1)
  # 
  #   a[row_t]=paste(substr(a[row_t],1,22),CN[Ite])
  # }
  

  Num=24#Number of Applications
  CNPer=round(runif(Nsims, min=0.90, max=1.10),2)
  row_0=18
  for (i in 1:Num){
    row_t=row_0+(i-1)
    cn_list <- unlist(strsplit(a[row_t],","))
    #cn_list[6]<-(as.numeric(CNPer[Ite]))*(as.numeric(cn_list[6]))
    cn_list[6]<-round((CNPer[Ite]*(as.numeric(cn_list[6]))),0)
    a[row_t]=paste(cn_list,collapse=",")

  }
  #####################root depth###############################################################################
  Numd=54#Number of crop periods that follow
  depth=round(runif(Nsims, min=0.80, max=1.20),2)#152almond
  row_0=45
  for (i in 1:Numd){
    row_t=row_0+(i-1)
    depth_list <- unlist(strsplit(a[row_t],","))
    depth_list[10]<-round((depth[Ite]*(as.numeric(depth_list[10]))),1)
    a[row_t]=paste(depth_list,collapse=",")
  }

  ######################USLEC##########################################################################################
  Numd=54#Number of crop periods that follow
  uslec=round(runif(Nsims, min=0.25, max=0.99),2)
  row_0=120
  for (i in 1:Numd){
    row_t=row_0+(i-1)

    a[row_t]=paste(substr(a[row_t],1,71), sprintf("%.02f",uslec[Ite]), substr(a[row_t],76,92),sep="")
  }
  ####Bulk density#############################################################################################


  bd1=round(runif(Nsims, min=1, max=2),2) #1st layer
  bd2=round(runif(Nsims, min=1, max=2),2) #2st layer
  bd3=round(runif(Nsims, min=1, max=2),2) #3st layer
  bd4=round(runif(Nsims, min=1, max=2),2) #4st layer
  bd5=round(runif(Nsims, min=1, max=2),2) #5st layer
  # BD6=runif(Nsims, min=1, max=2)

  bd1_list <- unlist(strsplit(a[107],","))
  bd1_list[5]<-bd1[Ite]
  a[107]=paste(bd1_list,collapse=",")

  bd2_list <- unlist(strsplit(a[108],","))
  bd2_list[5]<-bd2[Ite]
  a[108]=paste(bd2_list,collapse=",")

  bd3_list <- unlist(strsplit(a[109],","))
  bd3_list[5]<-bd3[Ite]
  a[109]=paste(bd3_list,collapse=",")

  bd4_list <- unlist(strsplit(a[110],","))
  bd4_list[5]<-bd4[Ite]
  a[110]=paste(bd4_list,collapse=",")

  bd5_list <- unlist(strsplit(a[111],","))
  bd5_list[5]<-bd5[Ite]
  a[111]=paste(bd5_list,collapse=",")
  #######################################################################################################
  Num=54#Number of Applications
  dep=round(runif(Nsims, min=0.975, max=1.025),2)
  row_0=120
  for (i in 1:Num){
    row_t=row_0+(i-1)
    dep_list <- unlist(strsplit(a[row_t],","))
    dep_list[7]<-round((dep[Ite]*(as.numeric(dep_list[7]))),2)
    a[row_t]=paste(dep_list,collapse=",")

  }

  ###########################################################################################################
  newdir <- paste0("c:/git/sinnathamby_pwc/input/przm/input",Ite)
  print(newdir)
  dir.create(newdir,showWarnings = FALSE) 
  cwd <- getwd()          # CURRENT dir
  setwd(newdir) 
  #copy weather file
  weather_input <- paste(pwcdir_exe, pwc_weather_used, sep="")
  file.copy(weather_input,newdir, recursive = FALSE, 
            copy.mode = TRUE)

  file_path_as_absolute(newdir)
  #update weather and output under each input folder
  a[4]=paste(file_path_as_absolute(newdir),"/",pwc_weather_used, sep="")
  a[6]=paste(file_path_as_absolute(newdir),"/","output.zts", sep="")
  #copy PRZM.exe
  print(paste(file.exists(przmdir_executable), ": executable file at", przmdir_executable))
  file.copy(przmdir_executable,newdir, recursive = FALSE, 
            copy.mode = TRUE)
  
  
  source(paste(pwcdir,"src/02_write_update_vvwm.R",sep = ""))
  #copy VVWM.exe
  print(paste(file.exists(vvwmdir_executable), ": executable file at", vvwmdir_executable))
  file.copy(vvwmdir_executable,newdir, recursive = FALSE, 
            copy.mode = TRUE)
  #write input file
  local_file <- paste("PRZM5",".inp", sep="")
  file.exists(local_file)
  file.create(local_file)
  file.exists(local_file)
  fileConn <-file(local_file)
  writeLines(a, 
             fileConn)
  # source(paste(pwcdir,"src/02write_przm_input.R",sep = ""))
  #run###PRZM.exe#
  system2(przmdir_executable)
  # #run###vvwm.exe#
  system2(vvwmdir_executable, "vvwmTransfer.txt")
  ###########################################################
  ###############PRZM#############################################################
  df <- read.table(paste(newdir,"/","output",".zts", sep=""), header= FALSE, sep= "",
                   skip = 3, stringsAsFactors = FALSE, row.names=NULL)
 
  newdf <- df[,3:ncols]
  outputdf[1:nrows,1:ncols,Ite] <- abind(df[1:nrows,1:ncols], along=3)
  ########################PWC outpput################################################################
  pwcdf <- read.csv(paste(newdir,"/","output_CAalmond_WirrigSTD_Custom_Parent_daily",".csv", sep=""), header= FALSE, sep= ",",
                    skip = 5, stringsAsFactors = FALSE, row.names=NULL)
  

  pwcoutdf[1:nrows,1:ncols,Ite] <- abind(pwcdf[1:nrows,1:ncols], along=3)
  
  # newarray <- pwcdf[,2:ncols]
  # pwcoutdf[1:nrows,1:(ncols-1),Ite] <- abind(newarray[1:nrows,1:(ncols-1)], along=3)
  ###########################################################################################
 #reading conversion factor from output################
  #con_fac <- scan((paste(newdir,"/","output_CAalmond_WirrigSTD_Custom_Parent",".txt", sep="")),skip=15,nlines=1,what="int")
  
  con <- file(paste(newdir,"/","output_CAalmond_WirrigSTD_Custom_Parent",".txt", sep=""))
  #print(con)
  open(con)
  con_fac_line<-read.table(con,skip=15,nrow=1) #16-th line
  con_fac[Ite,]<-as.numeric(con_fac_line%>%select_if(is.numeric))
  print(con_fac)
  close(con)
  ##############################################################################################
  setwd(cwd)
  close(fileConn)
}

output <- data.frame(con_fac)
save(output, file = paste(pwcdir,"io/output.RData",sep = ""))
class(output)




