#create input files #########
for (i in 1:Nsims) {
  parameter0 <- ("Depositionrate=") #Deposition Rate
  inputvalue0 <- depositionrate[i]
  parameter1 <- ("Efficiency=") #Efficiency
  inputvalue1 <- efficiency[i]
  parameter2 <- ("Drfitfraction=") #Drfitfraction
  inputvalue2 <- drfitfraction[i]
  pwcinput0 <- paste(parameter0, inputvalue0, sep = " ")
  write(pwcinput0, file = paste(pwcdir_in_przm, "input", i, ".txt", sep = ""), append = FALSE)
  write(pwcinput0, file = paste(pwcdir_in_vvwm, "input", i, ".txt", sep = ""), append = FALSE)
  pwcinput1 <- paste(parameter1, inputvalue1, sep = " ")
  write(pwcinput1, file = paste(pwcdir_in_przm, "input", i, ".txt", sep = ""), append = TRUE)
  write(pwcinput1, file = paste(pwcdir_in_vvwm, "input", i, ".txt", sep = ""), append = TRUE)
  pwcinput2 <- paste(parameter2, inputvalue2, sep = " ")
  write(pwcinput2, file = paste(pwcdir_in_przm, "input", i, ".txt", sep = ""), append = TRUE)
  write(pwcinput2, file = paste(pwcdir_in_vvwm, "input", i, ".txt", sep = ""), append = TRUE)
  }

# pwcfile=readLines("C:/git/sinnathamby_pwc/input/przm/RLF_Forest_Chloropyrifos.PWC",-2)
# pwcfile[32]="5,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,"
# writeLines(pwcfile,"C:/git/sinnathamby_pwc/input/przm/RLF_Forest_Chloropyrifos.PWC")

# for (i in 1:Nsims) {
#   parameter0 <- ("Depositionrate=") #Deposition Rate
#   inputvalue0 <- depositionrate[i]
#   pwcinput0 <- paste(parameter0, inputvalue0, sep = " ")
#   pwcfile=readLines("C:/git/sinnathamby_pwc/input/przm/RLF_Forest_Chloropyrifos.PWC",-2)
#   pwcfile[32]=parameter0
#   writeLines(pwcinput0,file = paste(pwcdir_in_vvwm, "input", i, ".txt", sep = ""), append = FALSE)
# }