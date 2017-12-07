#0. MAIN
# Počisti global environment
# Iz tekstovne datoteke prebere podatke v tabelo

# Uporaba v drugih datotekah: source("path");


#Počisti global
rm(list = ls());

#Nastavi working directory
setwd("E://Projects//R Studio//uiSeminarska1");

#Prebere podatke v tabelo
table <- read.table("podatki//podatkiSem1.txt",TRUE,",");

