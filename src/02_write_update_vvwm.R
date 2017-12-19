con <- file(paste(pwcdir, "input/przm/vvwmTransfer",".txt",sep=""))
l_old=readLines(con)
l=readLines(con)
l[1]="C:\\Users\\ssinnath\\Research\\CAVernalPools\\vvwm\\Bifenthrin\\wsb9\\almond"#output filename
l[2]=""#unused
l[3]="1"#nchem
l[4]="True"#is_koc
l[5]="216500,,,"#Sorption coefficient (mL/g); the number of values should match nchem
l[6]="323.6,,,"#Water column degradation half-life (days); the number of values should match nchem
l[7]="20,,,"#temp_ref_aer_allReference temperature for water column degradation; the number of values should match nchem
l[8]="647.2,,,"#Benthic degradation half-life (days); the number of values should match nchem
l[9]="20,,,"#Reference temperature for benthic degradation; the number of values should match nchem
l[10]="255,,,"#Photolysis half-life (days); the number of values should match nchem
l[11]="40,,,"#Reference latitude for photolysis; the number of values should match nchem
l[12]="2007,,,"#Hydrolysis half-life (days); the number of values should match nchem
l[13]="161.8,,,"#
l[14]="20,"#
l[15]="12.7,,,"#
l[16]="422.9,,,"#Molecular Weight; the number of values should match nchem
l[17]="1.80E-03,,,"#Vapor Pressure (torr); the number of values should match nchem
l[18]="0.000014,,,"#Solubility (mg/L); the number of values should match nchem
l[19]="0,0,"#
l[20]="0,0,"#
l[21]="0,0,"#
l[22]="0,0,"#
l[23]="0,0,"#
l[24]="0,0,"#
l[25]="0.0,,,"#
l[26]="7.20E-03,,,"#
l[27]="0.0,,,"#
l[28]="2"#
l[29]="CAalmond_WirrigSTD"#
l[30]="C:\\git\\sinnathamby_pwc\\exe\\17955_grid.wea"#
l[31]="40"#
l[32]="True,True,True,False,False,False,False"#
l[33]="False,30,1,"#
l[34]="False"#
l[35]="894356"#
l[36]="1745.45"#
l[37]="4.0"#
l[38]="4.5"#
l[39]="1E-08"#
l[40]="False,0.5"#
l[41]="0.05"#benthic_depth
l[42]="0.5"#porosity
l[43]="1.35"#bulk_density
l[44]="0.04"#Fraction of organic carbon on sediment in benthic region.
l[45]="5"#Concentration of dissolved organic carbon in benthic region (mg/L)
l[46]="0.006"#Areal concentration of biosolids in benthic region (g/m2)
l[47]="1.19"#Photolysis parameter defined in eqn. 23
l[48]="30"#Suspended solids concentration in water column (mg/L)
l[49]="0.005"#Chlorophyll concentration in water column (mg/L)
l[50]="0.04"#Fraction of organic carbon on suspended sediment in water column.
l[51]="5"#Concentration of dissolved organic carbon in water column (mg/L)
l[52]="0.4"#Concentration of biosolids in water column (mg/L)
l[53]="False"#
l[54]="1.0,1.0"#
l[55]=""#
l[56]="54"#Number of spray drift events that will be used to apply pesticide mass to pond
l[57]="19654,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,-715874,"#Dates of spray drift events reference to days of the simulation (first day of simulation = 1)
l[58]="1"#Flag to identify the type of water body: 1= User defined parameters; 2=USEPA Pond; 3=USEPA Reservoir; 4 = constant vol no flow; 5 = constant vol w/flow
l[59]="894356"#Area of adjacent runoff producing field. This is used to convert area-normalized pesticide mass in the mass-input file to actual mass (m2).
l[60]="1745.45"#Area of water body (m2).
l[61]="4.0"#Depth at which the input concentrations of physical parameters (e.g., suspended solids, CHL., etc) were measured.
l[62]="4.5"#Maximum depth that water can rise before overflow (m).
l[63]="0.002757811,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"#Mass of pesticide (kg) delivered from spray drift corresponding to dates of appdate_sim_ref(i)
l[64]="0"#Number of days that are used to average the influent water flow. If = 0, then the flow rate to be used in the program is the average flow rate of the entire simulation.
l[65]="0.0"#Provids an additional constant flow through the waterbody m3/s
l[66]="1"#Holds the Fraction of Cropped Area. Of the watershed. Only used so that it is recorded in the output. Program does not use these values for calculations
l[67]="False"#
l[68]="False,15"#
l[69]="C:\\Users\\ssinnath\\models\\pwc 1.59\\almond_CAalmond_WirrigSTD_Custom_Parent_daily.csv"#
l[70]="C:\\Users\\ssinnath\\models\\pwc 1.59\\almond_CAalmond_WirrigSTD_Custom_Degradate1_daily.csv"#
l[71]="C:\\Users\\ssinnath\\models\\pwc 1.59\\almond_CAalmond_WirrigSTD_Custom_Degradate2_daily.csv"#
l[72]="C:\\Users\\ssinnath\\models\\pwc 1.59\\almond_CAalmond_WirrigSTD_Custom_Parent.txt"#
l[73]="C:\\Users\\ssinnath\\models\\pwc 1.59\\almond_CAalmond_WirrigSTD_Custom_Degradate1.txt"#
l[74]="C:\\Users\\ssinnath\\models\\pwc 1.59\\almond_CAalmond_WirrigSTD_Custom_Degradate2.txt"#
l[75]="C:\\Users\\ssinnath\\models\\pwc 1.59\almond_CAalmond_WirrigSTD_Custom_Parent_DEEM.rdf"#
l[76]="C:\\Users\\ssinnath\\models\\pwc 1.59\\almond_CAalmond_WirrigSTD_Custom_Degradate1_DEEM.rdf"#
l[77]="C:\\Users\\ssinnath\\models\\pwc 1.59\\almond_CAalmond_WirrigSTD_Custom_Degradate2_DEEM.rdf"#
l[78]="C:\\Users\\ssinnath\\models\\pwc 1.59\\almond_CAalmond_WirrigSTD_Custom_Parent_Calendex.rdf"#
l[79]="C:\\Users\\ssinnath\\models\\pwc 1.59\\almond_CAalmond_WirrigSTD_Custom_Degradate1_Calendex.rdf"#
l[80]="C:\\Users\\ssinnath\\models\\pwc 1.59\\almond_CAalmond_WirrigSTD_Custom_Degradate2_Calendex.rdf"#
l[81]="C:\\Users\\ssinnath\\models\\pwc 1.59\\almond_CAalmond_WirrigSTD_Custom_15_Parent.txt"#
l[82]="C:\\Users\\ssinnath\\models\\pwc 1.59\\almond_CAalmond_WirrigSTD_Custom_15_Degradate1.txt"#
l[83]="C:\\Users\\ssinnath\\models\\pwc 1.59\\almond_CAalmond_WirrigSTD_Custom_15_Degradate2.txt"#

################
benthic_depth=round(runif(Nsims, min=0, max=1),2)
l[41]=paste(benthic_depth[Ite])
##########################
porosity=round(runif(Nsims, min=0, max=1),2)
l[42]=paste(porosity[Ite])
###########################################################################
bulk_density=round(runif(Nsims, min=0, max=1),2)
l[43]=paste(bulk_density[Ite])
###########################################################################
FROC2=round(runif(Nsims, min=0, max=1),2)
l[44]=paste(FROC2[Ite])
###########################################################################
DOC2=round(runif(Nsims, min=0, max=15),2)#Concentration of dissolved organic carbon in benthic region (mg/L)
l[45]=paste(DOC2[Ite])
###########################################################################
BNMAS=round(runif(Nsims, min=0.001, max=0.010),3)#Areal concentration of biosolids in benthic region (g/m2)
l[46]=paste(BNMAS[Ite])
###########################################################################
SUSED=round(runif(Nsims, min=0, max=150),2)#Suspended solids concentration in water column (mg/L)
l[48]=paste(SUSED[Ite])
###########################################################################
CHL=round(runif(Nsims, min=0.001, max=0.010),3)#Chlorophyll concentration in water column (mg/L)
l[49]=paste(CHL[Ite])
###########################################################################
FROC1=round(runif(Nsims, min=0.0, max=1.0),2)#Fraction of organic carbon on suspended sediment in water column.
l[50]=paste(FROC1[Ite])
###########################################################################
DOC1=round(runif(Nsims, min=0.0, max=50.0),2)#Concentration of dissolved organic carbon in water column (mg/L)
l[51]=paste(DOC1[Ite])
###########################################################################
PLMAS=round(runif(Nsims, min=0.0, max=5.0),2)#Concentration of biosolids in water column (mg/L)
l[52]=paste(PLMAS[Ite])
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

local_file <- paste("vvwmTransfer",".txt", sep="")
file.exists(local_file)
file.create(local_file)
file.exists(local_file)
fileConn <-file(local_file)
writeLines(l, 
           fileConn)