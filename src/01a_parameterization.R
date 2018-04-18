##################create input distributions##################
weather_file<- rep(paste(pwc_weather_used, sep = ""), Nsims)
sim_start<- rep(paste(simstart, sep = ""), Nsims)
sim_end<- rep(paste(simend, sep = ""), Nsims)
inputdf<- data.frame(weather_file, sim_start, sim_end)

##############Parmater distribution##########################
PFAC=runif(Nsims, min=0.70, max=0.80);inputdf <- cbind(inputdf, PFAC)#Pan factor
# Soils high in clay have low K values, about 0.05 to 0.15, because
# they resistant to detachment. Coarse textured soils, such as sandy soils,
# have low K values, about 0.05 to 0.2, because of low runoff even though
# these soils are easily detached. Medium textured soils, such as the silt loam soils,
# have a moderate K values, about 0.25 to 0.4, because they are moderately susceptible
# to detachment and they produce moderate runoff. Soils having a high silt content are
# most erodible of all soils. They are easily detached; tend to crust and produce high rates
# of runoff. Values of K for these soils tend to be greater than 0.4.
uslek=runif(Nsims, min=0.05, max=0.65); inputdf <- cbind(inputdf, uslek)#soil erodibility factor
uslels=runif(Nsims, min=0.01, max=5);inputdf <- cbind(inputdf, uslels)#uslels slope length factor, representing the effect of slope length on erosion
uslep=runif(Nsims, min=0.01, max=1);inputdf <- cbind(inputdf, uslep)#uslep0.10 (extensive practices) to 1.0 (no supporting practices)
CN_c=runif(Nsims, min=61, max=91);inputdf <- cbind(inputdf, CN_c)#CN cropping
CN_f=runif(Nsims, min=82, max=88);inputdf <- cbind(inputdf, CN_f)#CN follow
depth=runif(Nsims, min=1, max=130);inputdf <- cbind(inputdf, depth)#maximum soil depth is 139 cm. Root depth can't deeper than the depth of the soil layer
uslec=round(runif(Nsims, min=0.003, max=1.0),3);inputdf <- cbind(inputdf, uslec)#0.001 (well managed) to 1.0 (fallow or tilled condition)
bd1=round(runif(Nsims, min=1.4, max=1.7),2);inputdf <- cbind(inputdf, bd1) #1st layer bulk density
bd2=round(runif(Nsims, min=1.4, max=1.7),2);inputdf <- cbind(inputdf, bd2) #2st layer
bd3=round(runif(Nsims, min=1.4, max=1.7),2);inputdf <- cbind(inputdf, bd3) #3st layer
bd4=round(runif(Nsims, min=1.4, max=1.7),2);inputdf <- cbind(inputdf, bd4) #4st layer
bd5=round(runif(Nsims, min=1.4, max=1.7),2);inputdf <- cbind(inputdf, bd5) #5st layer
dep=runif(Nsims, min=0.1, max=6);inputdf <- cbind(inputdf, dep)#depth of the pesticide application
app_rate=runif(Nsims, min=0.1, max=6);inputdf <- cbind(inputdf, app_rate)#application rate
koc=runif(Nsims, min=600, max=1000);inputdf <- cbind(inputdf, koc)#Sorption coefficient (mL/g)
aer_aq=runif(Nsims, min=5, max=35);inputdf <- cbind(inputdf, aer_aq)#Water column degradation half-life (days)
temp_ref_aer=runif(Nsims, min=5, max=35);inputdf <- cbind(inputdf, temp_ref_aer) #Reference temperature for water column degradation
anae_aq=runif(Nsims, min=5, max=150);inputdf <- cbind(inputdf, anae_aq)#Benthic degradation half-life (days)
temp_ref_anae=runif(Nsims, min=5, max=35);inputdf <- cbind(inputdf, temp_ref_anae)#Reference temperature for benthic degradation;
photo=round(runif(Nsims, min=0.1, max=25),1);inputdf <- cbind(inputdf, photo)#Diazinon was stable to aqueous photolysis and acceptable soil photolysis data are not available
RFLAT=runif(Nsims, min=5, max=45);inputdf <- cbind(inputdf, RFLAT)#Reference latitude for photolysis
hydro=round(runif(Nsims, min=0.1, max=50),1);inputdf <- cbind(inputdf, hydro)#Hydrolysis half-life (days); Stable
SOL=round(runif(Nsims, min=0.1, max=90),1);inputdf <- cbind(inputdf, SOL)#Solubility (mg/L)
benthic_depth=round(runif(Nsims, min=0.01, max=1),2);inputdf <- cbind(inputdf, benthic_depth)#Depth of benthic region (m)
porosity=round(runif(Nsims, min=0.1, max=0.8),2);inputdf <- cbind(inputdf, porosity)
bulk_density=round(runif(Nsims, min=1.4, max=1.7),2);inputdf <- cbind(inputdf, bulk_density)
FROC2=round(runif(Nsims, min=0.01, max=0.99),2);inputdf <- cbind(inputdf, FROC2)#Fraction of organic carbon on sediment in benthic region.
DOC2=round(runif(Nsims, min=0.01, max=60),2);inputdf <- cbind(inputdf, DOC2)#Concentration of dissolved organic carbon in benthic region (mg/L)
BNMAS=round(runif(Nsims, min=0.001, max=5),3);inputdf <- cbind(inputdf, BNMAS)#Areal concentration of biosolids in benthic region (g/m2)
SUSED=runif(Nsims, min=1, max=80);inputdf <- cbind(inputdf, SUSED)#Suspended solids concentration in water column (mg/L)
CHL=round(runif(Nsims, min=0.001, max=1.5),3);inputdf <- cbind(inputdf, CHL)#Chlorophyll concentration in water column (mg/L)
FROC1=round(runif(Nsims, min=0.01, max=1),2);inputdf <- cbind(inputdf, FROC1)#Fraction of organic carbon on suspended sediment in water column.
DOC1=round(runif(Nsims, min=0.1, max=15),1);inputdf <- cbind(inputdf, DOC1)#Concentration of dissolved organic carbon in water column (mg/L)
PLMAS=round(runif(Nsims, min=0.001, max=10),2);inputdf <- cbind(inputdf, PLMAS)#Concentration of biosolids in water column (mg/L)


#create PRZM and VVWM input df and saving as csv in the io directory 
write.csv(inputdf, file = paste(pwcdir, "io/inputdata_przm_vvwm.csv", sep = ""))
