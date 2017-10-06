#document the system status
#exe
print(paste(file.exists(pwcdir_executable), ": executable file at", pwcdir_executable))
#sample input
sample_input_file <- paste(pwcdir_in_przm, "input10.txt", sep="")
print(paste(file.exists(sample_input_file), ": sample input file at", sample_input_file))
#pwc file
pwc_file <- paste(pwcdir_exe, pwc_filename, sep="")
print(paste(file.exists(pwc_file), ": pwc inputs file at", pwc_file))
#weather file
weather_input <- paste(pwcdir_exe, pwc_weather_used, sep="")
print(paste(file.exists(weather_input), ": weather file at", weather_input))
#pwc <-> weather file message
print("the .PWC file has to know where the weather file is, R cannot tell it!")
for (i in 1:Nsims) {
  # n<-inputtest[i]
  inputfile<- paste("input",i,".txt", sep="")
  outputfile<- paste("results",i,".txt", sep="")
  logfile<- paste("log",i,".txt", sep="")
  
  pwcdir_command <- paste(pwcdir_exe, pwc_filename, 
                         " /b /or ", pwcdir_output, outputfile, 
                         " /i ", pwcdir_input, inputfile, " /ol ", pwcdir_log, logfile, sep="")
  print(paste(pwcdir_executable, pwcdir_command, sep=" "))
  system2(pwcdir_executable, pwcdir_command)
}