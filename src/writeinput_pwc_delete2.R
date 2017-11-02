fileConn <-file("pwcinput.txt")
writeLines(c("Pesticide Water Calculator (PWC), Version 1.59","","1","True","6040,,,",
             "91.2,,,","25,,,","202.7,,,","25,,,","29.6,,,","40,,,","0,,,","170.6,,,","25,",
             "35,,,","350.57,,,","1.87E-05,,,","1.4,,,","0,0,","0,0,","0,0,","0,0,",
             "0,0,","0,0,","0.0,,,","0.000252,,,","98000,,,","2"), fileConn)
close(fileConn)
file.show("pwcinput.txt")

# sink("pwcinput.txt")
# cat("Pesticide Water Calculator (PWC), Version 1.59")
# cat("\n")
# cat"")
# cat("\n")
# cat("1")
# sink()
# file.show("pwcinput.txt")


