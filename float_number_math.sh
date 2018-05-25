# Do a calculation of float number "$exp" setting precision to "$prec" size

exp="(-105.5*7+50*3)/20+(19^2)/7"
prec=3

awk "BEGIN {printf \"%.${prec}f\n\", ${exp}}"