source("skripte//main.R");

#1. VIZUALIZACIJA


#Distribucija cilnjih spremenljivk
hist(table$PM10);
hist(table$O3);

boxplot(table$PM10, horizontal = TRUE);
boxplot(table$O3, horizontal = TRUE);

nrow()

