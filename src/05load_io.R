#load output files
#Output.zts
load(paste(pwcdir, "io/przmout.RData", sep = ""))
dim(outputdf)
#pwc output
load(paste(pwcdir, "io/pwcout.RData", sep = ""))
load(paste(pwcdir, "io/output.RData", sep = ""))
dim(pwcoutdf)
#TIME
load(paste(pwcdir,"io/timearray.RData", sep = ""))
#write.csv(timearray, file = paste(pwcdir, "io/timearray.csv", sep = ""))
nrows<- length(timearray)
#read input files
indata <- read.csv(file = paste(pwcdir, "io/inputdata_przm_vvwm.csv", sep = ""), header = TRUE)
#cut out column "X"
inputdata<- indata%>%select_if(is.numeric)%>%select(-1)
inputdata2<- indata%>%select_if(is.numeric)
#extract input vectors from dataframe
for(i in 1:length(inputdata)){assign(names(inputdata)[i], inputdata[[i]])}

