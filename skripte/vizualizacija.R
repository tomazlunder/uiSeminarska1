source("skripte//main.R");

#1. VIZUALIZACIJA


#Distribucija cilnjih spremenljivk
hist(table$PM10);
hist(table$O3);

boxplot(table$PM10, horizontal = TRUE);
boxplot(table$O3, horizontal = TRUE);

# PIE CHARTI PORAZDELITEV PO RAZREDIH ZA
# - o3
slices <- c(nrow(table[table$O3R == 0,]), nrow(table[table$O3R == 1,]),nrow(table[table$O3R == 2,]),nrow(table[table$O3R == 3,]));
labels <- c("NIZKA","SREDNJA", "VISOKA", "EKSTREMNA");
pct <- round(slices/sum(slices)*100,3);
labels <- paste(labels, pct);

pie(slices, labels);
# - pm10
slices <- c(nrow(table[table$PM10R == 0,]), nrow(table[table$PM10R == 1,]));
labels <- c("NIZKA", "VISOKA");
pct <- round(slices/sum(slices)*100,3);
labels <- paste(labels, pct);

pie(slices, labels);

pieo3 <- function (table){
slices <- c(nrow(table[table$O3R == 0,]), nrow(table[table$O3R == 1,]),nrow(table[table$O3R == 2,]),nrow(table[table$O3R == 3,]));
labels <- c("NIZKA","SREDNJA", "VISOKA", "EKSTREMNA");
pct <- round(slices/sum(slices)*100,3);
labels <- paste(labels, pct);

pie(slices, labels);
}

