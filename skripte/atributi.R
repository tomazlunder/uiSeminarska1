source("skripte//main.R");

#2. OCENJEVANJE IN PREDELAVA ATRIBUTOV


#Vrstice z PM10 manjšim od nič (nepravilne meritve - mogoče bo treba odstranitihist), O3 so use ok
#table[,table$PM10<0]

# Obdelava podatkov:
# - Atribut datum spremenimo v atribute: Dan v letu (DOY), dan v tednu(DOW) in ju dodamo v tabelo
# - Dodamo stolpca za razrede koncentracije O3 in PM 10;
#   O3   [NIZKA < 60, 60 <= SREDNJA < 120, 120 <= VISOKA < 180, 180 < EKSTREMNA] ... NIZKA - 0, SREDNJA - 1, VISOKA - 2, EKSTREMNA - 3
#   PM10 [NIZKA < 35, 35 <= VISOKA] ...                                              NIZKA - 0, VISOKA - 1

vec_doy <- c();
vec_dow <- c();

vec_o3_klas <- c();
vec_pm10_klas <- c();

for(i in c(1:nrow(table)))
{
  datum <- table[i,1];
  doy_s <- strftime(datum, format("%j"));
  dow_s <- strftime(datum, format("%w"));
  doy <- as.numeric(doy_s);
  dow <- as.numeric(dow_s) +1;
  vec_doy[i] <- doy;
  vec_dow[i] <- dow;
  
  o3 <- table[i,27];
  
  if(o3 < 60){
    vec_o3_klas[i] <- 0;
  } else if (o3 >= 60 & o3 < 120){
    vec_o3_klas[i] <- 1;
  } else if (o3 >= 120 & o3 < 180){
    vec_o3_klas[i] <- 2;
  } else if (o3 >= 180){
    vec_o3_klas[i] <- 3;
  }
  
  pm10 <- table[i,26];

  
  if(pm10 < 35){
    vec_pm10_klas[i] <- 0;
  } else {
    vec_pm10_klas[i] <- 1;
  }
}

table <- cbind(table, vec_doy);
table <- cbind(table, vec_dow);
table <- cbind(table, vec_o3_klas);
table <- cbind(table, vec_pm10_klas);

#Odstrani datum
table <- table[,-1];

table = table[,c(27,28,1:24,26,29,25,30)]

#Preimenuje stolpca
names(table)[names(table) == "vec_doy"] = "DOY";
names(table)[names(table) == "vec_dow"] = "DOW"; 
names(table)[names(table) == "vec_o3_klas"] = "O3R";
names(table)[names(table) == "vec_pm10_klas"] = "PM10R";

write.csv(table,file = "podatki//obdelani//obdelano1.csv");

table2 <- read.table("podatki//obdelani//obdelano1", T, ",");
table2 <- table2[,-1];

