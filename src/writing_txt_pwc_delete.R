#setting folders
current.folder <-"C:/git/sinnathamby_pwc/input/pwc/"
new.folder <-"C:/git/sinnathamby_pwc/input/"
list.of.files <-list.files(current.folder, ".txt$")
#copying PWC input file
old_file <- paste(current.folder, list.of.files, sep="")

new_file <- paste(new.folder, list.of.files, sep="")
file.exists(old_file)
file.copy(old_file, new_file)
list.files()
# file.rename(".txt$",".PWC$")

sapply(new_file,FUN=function(eachPath){file.rename(from=eachPath,to=sub(".txt$",".PWC",eachPath))
})

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





