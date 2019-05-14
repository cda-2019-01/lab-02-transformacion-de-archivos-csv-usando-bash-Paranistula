
csvstack estacion1.csv estacion2.csv estacion3.csv estacion4.csv > estaciones.csv #agrupar archivos
for x in estaciones/*; do head -1 ${x} > temp1.csv; break; done
sed 's/.*/ESTACION\;&/g' temp1.csv > temp2.csv
for x in estaciones/*; do est=$(echo $x | sed -e 's/[a-zA-Z]*\///' -e 's/\.[a-zA-Z]*//');sed -e 1d -e "s/.*/${est}\;&/g" $x >> temp2.csv; done head -n 200000 temp2.csv > temp3.csv
sed -e 's/\,/\./g' -e 's/;/,/g' temp3.csv > temp4.csv
sed 's/\,\([0-9]\)\//\,0\1\//' temp4.csv  > temp5.csv #buscar la primera coma que aparezca y 
