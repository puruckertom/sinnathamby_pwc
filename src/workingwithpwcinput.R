#setting folders
current.folder <-"C:/git/sinnathamby_pwc/input/przm/"
new.folder <-"C:/git/sinnathamby_pwc/input/"
list.of.files <-list.files(current.folder, ".PWC$")
#copying PWC input file
old_file <- paste(current.folder, list.of.files, sep="")

new_file <- paste(new.folder, list.of.files, sep="")
file.exists(old_file)
file.copy(old_file, new_file)
setwd("C:/git/sinnathamby_pwc/input/")
list.files()
file.rename("alfalfaml.PWC","alfalfaml.txt")

parameters=scan("alfalfaml.txt", sep="",what="")

readLines("alfalfaml.txt")
alfalfaml.txt[29]=10#number of application
parameter0 <-

# removeExt("alfalfaml.PWC")
# list.files()
# 
# 
# #install limma to remove extension
# source("http://bioconductor.org/biocLite.R") # downloads the latest bioconductor script/repos
# biocLite("limma")
# library(limma)
# #removing .PWC extension
# 
# new_file1 <- removeExt("C:/git/sinnathamby_pwc/input/alfalfaml.PWC")
# new_file1
# #adding .txt
# new_text<- paste(new.folder, new_file1, sep="",".txt")
# new_text
# new_text1 <- paste(new.folder, new_text, sep="")





