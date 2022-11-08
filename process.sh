awk -F, '{if ($18 >= 1.0) {num++; total += $18;} } END { print "RATING_AVG " total / num }' $1
awk -F, '{col[tolower($7)]++} END {for (i in col) print "HOTELNUMBER " tolower(i) " " col[i]}' $1 | sort
awk -F, '{col[tolower($7)]++; if ($2 ~ /holiday inn/ && $12 > 0) {hic[tolower($7)] += $12; hin[tolower($7)]++;} else if ($1 ~ /hilton/ && $12 > 0){hc[tolower($7)] += $12; hn[tolower($7)]++;} } END {for (i in col) print "CLEANLINESS " i " " hic[i] / hin[i] " " hc[i] / hn[i]}' $1
gnuplot -persist <<-EOFMarker
set terminal png size 500,500 enhanced font "Helvetica,14"
set output 'graph.png'
set title "Correlation between Cleanliness and overall rating" font ",12" textcolor rgbcolor "royalblue"
set pointsize 1
set datafile separator ','
plot '$1' using 16, 10 with linespoints
f(x) = a*x + b
fit f(x) '$1' using 16:10 via a,b
EOFMarker
