csvstack estacion*.csv > ESTACIONES.csv #agrupar archivos
for x in estaciones/*; do head -1 ${x} > out1.csv; break; done
sed 's/.*/ESTACION\;&/g' out1.csv > out2.csv
for x in estaciones/*; do est=$(echo $x | sed -e 's/[a-zA-Z]*\///' -e 's/\.[a-zA-Z]*//');sed -e 1d -e "s/.*/${est}\;&/g" $x >> out2.csv; done head -n 200000 out2.csv > out3.csv
sed -e 's/\,/\./g' -e 's/;/,/g' temp3.csv > temp4.csv
sed 's/\,\([0-9]\)\//\,0\1\//' temp4.csv  > temp5.csv #buscar la primera coma que aparezca y 
