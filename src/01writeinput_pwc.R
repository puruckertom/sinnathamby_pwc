for (i in 1:Nsims) {

# create list, 
n_applications = 8
n_max = 50
app_vector0 <- rep(runif(1,0,10),n_applications)
app_string0 <- paste(app_vector0, collapse=",")
commas <- paste(replicate(n_max-n_applications, ","), collapse = "")
appl_amount <- paste(app_string0, commas, sep="")
appl_amount

# n_applications = 4
# n_max = 50
app_vector1 <- rep(runif(1,0,1),n_applications)
app_string1 <- paste(app_vector1, collapse=",")
commas <- paste(replicate(n_max-n_applications, ","), collapse = "")
efficiency_r <- paste(app_string1, commas, sep="")
efficiency_r

# n_applications = 4
# n_max = 50
app_vector2 <- rep(runif(1,0,1),n_applications)
app_string2 <- paste(app_vector2, collapse=",")
commas <- paste(replicate(n_max-n_applications, ","), collapse = "")
drift_fraction_r <- paste(app_string2, commas, sep="")
drift_fraction_r

# n_applications = 4
# n_max = 50
app_vector3 <- rep(runif(1,0,1),n_applications)
app_string3 <- paste(app_vector3, collapse=",")
commas <- paste(replicate(n_max-n_applications, ","), collapse = "")
efficiency_p <- paste(app_string3, commas, sep="")
efficiency_p

# n_applications = 4
# n_max = 50
app_vector4 <- rep(runif(1,0,1),n_applications)
app_string4 <- paste(app_vector4, collapse=",")
commas <- paste(replicate(n_max-n_applications, ","), collapse = "")
drift_fraction_p <- paste(app_string4, commas, sep="")
drift_fraction_p

# n_applications = 4
# n_max = 50
app_vector5 <- rep(runif(1,0,1),n_applications)
app_string5 <- paste(app_vector5, collapse=",")
commas <- paste(replicate(n_max-n_applications, ","), collapse = "")
efficiency_c <- paste(app_string5, commas, sep="")
efficiency_c

# n_applications = 4
# n_max = 50
app_vector6 <- rep(runif(1,0,1),n_applications)
app_string6 <- paste(app_vector6, collapse=",")
commas <- paste(replicate(n_max-n_applications, ","), collapse = "")
drift_fraction_c <- paste(app_string6, commas, sep="")
drift_fraction_c



text_chunk <- c("Pesticide Water Calculator (PWC), Version 1.59","","1","True","6040,,,",
                "91.2,,,","25,,,","202.7,,,","25,,,","29.6,,,","40,,,","0,,,","170.6,,,","25,",
                "35,,,","350.57,,,","1.87E-05,,,","1.4,,,","0,0,","0,0,","0,0,","0,0,",
                "0,0,","0,0,","0.0,,,","0.000252,,,","98000,,,","2","4",
                ",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,",
                ",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,",
                appl_amount,
                "False",
                "1972,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,",
                "2,2,2,2,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,",
                efficiency_r,
                drift_fraction_r,
                efficiency_p,
                drift_fraction_p,
                drift_fraction_c,
                drift_fraction_c,
                "4,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,",
                "1,10,20,30,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,",
                "False, 1",
                ",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,",
                ",",
                ",",
                ",",
                "ILalfalfaNMC",
                "E:\\Research\\NewWeatherFiles\\20737_grid.wea",
                "40",
                "True,True,True,False,False,False,False",
                "False,30,1,",
                "False",
                "92175",
                "1745.45",
                "4.0",
                "4.5",
                "1E-08",
                "False,0.5",
                "0.05",
                "0.5",
                "1.35",
                "0.04",
                "5",
                "0.006",
                "1.19",
                "30",
                "0.005",
                "0.04",
                "5",
                "0.4",
                "False",
                "1.0,1.0",
                "",
                "******** start of PRZM information ******************",
                "True,False,False,",
                "1",
                "False,",
                "1,6,25,8,30,8,152,100,50,0.25,1,1,0",
                ",,,,,,,,,,1,1,0",
                ",,,,,,,,,,1,1,0",
                ",,,,,,,,,,1,1,0",
                ",,,,,,,,,,1,1,0",
                ",,,,,,,,,,1,1,0",
                ",,,,,,,,,,1,1,0",
                ",,,",",,,",
                "0.77,0.36,17.5",
                "*** irrigation information start ***",
                "0",
                ",,",
                "False,",
                "*** spare line for expansion",
                "*** spare line for expansion",
                "*** Soil Information ***",
                "0.294,1,1",
                "1,0.09,3500",
                "*** Horizon Info *******",
                "5",
                "23,15,15,41,60,",
                "1.55,1.55,1.58,1.62,1.7,",
                "0.3,0.3,0.3,0.3,0.3,",
                "0.15,0.17,0.05,0.05,0.11,",
                "0.435,0.145,0.145,0.168,0.145,",
                "100,7,60,60,60,",",,,,,",",,,,,",
                "*** Horizon End, Temperature Start ********",
                ",",
                "False","***spare line for expansion",
                "***spare line for expansion","*** Erosion & Curve Number Info **********",
                "26",
                "1,15,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,15,16,1,16,1,16,,,,,,,,,,,,,,,,,,,,,,,,,,,",
                "6,6,6,7,7,8,8,9,9,10,10,11,11,12,12,1,1,2,2,3,3,3,4,4,5,5,,,,,,,,,,,,,,,,,,,,,,,,,,,",
                "85,85,85,85,85,85,85,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,87,,,,,,,,,,,,,,,,,,,,,,,,,,,",
                ".002,.007,.006,.003,.001,.005,.003,.003,.005,.009,.013,.014,.014,.015,.015,.015,.015,.015,.016,.016,.018,.012,.006,.002,.007,.004,,,,,,,,,,,,,,,,,,,,,,,,,,,",
                ".110,.110,.110,.110,.110,.110,.110,.110,.110,.110,.110,.110,.110,.110,.110,.110,.110,.110,.110,.110,.110,.110,.110,.110,.110,.110,,,,,,,,,,,,,,,,,,,,,,,,,,,",
                "2.0,1.55,0.266,",
                "0.1,0,1.0,","False",",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,","5.0")

#then write it all to a file
# file.create("pwcinput.txt")
local_file <- paste(pwcdir, "input/pwc/pwcinput",i,".txt", sep="")
local_file
file.exists(local_file)
file.create(local_file)
file.exists(local_file)
fileConn <-file(local_file)
writeLines(text_chunk, 
           fileConn)
close(fileConn)
}
file.show("pwcinput.txt")
readLines("pwcinput.txt")





# paste(replicate(50, ","), collapse = "")
# line_chunk
# 
# text_chunk <- c(line_chunk001,
#                 line_chunk002


# 
# sink("pwcinput.txt")
# cat("Pesticide Water Calculator (PWC), Version 1.59")
# cat("\n")
# cat("")
# cat("\n")
# cat("1")
# sink()
# file.show("pwcinput.txt")



