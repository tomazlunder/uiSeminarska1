source("skripte//main.R");

#2. OCENJEVANJE IN PREDELAVA ATRIBUTOV


#Vrstice z PM10 manjšim od nič (nepravilne meritve - mogoče bo treba odstranitihist), O3 so use ok
#table[,table$PM10<0]

#Atribut datum spremenimo v atribute: Dan v letu (DOY), dan v tednu(DOW)
vec_doy <- c();
vec_dow <- c();

for(i in c(1:nrow(table)))
{
  datum <- table[i,1];
  doy_s <- strftime(datum, format("%j"));
  dow_s <- strftime(datum, format("%w"));
  doy <- as.numeric(doy_s);
  dow <- as.numeric(dow_s) +1;
  vec_doy[i] <- doy;
  vec_dow[i] <- dow;
}
vec_doy;

table <- cbind(table, vec_doy)
table <- cbind(table, vec_dow)

table2 <- table[-table&datum,]