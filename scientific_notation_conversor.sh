# Scientific Notation to Number Conversor

for i in 2,3567E+12 5,2178E+11  4,5106E+11 1,9877E+11 
do 
    FOO=$i
    BAR=$(printf "%.f" $FOO)
    echo $BAR
done