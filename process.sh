awk -F, '{if ($18 >= 1.0) {num++; total += $18;} } END { print "RATING_AVG " total / num }' $1
awk -F, '{col[tolower($7)]++} END {for (i in col) print "HOTELNUMBER " tolower(i) " " col[i]}' $1 | sort
awk -F, '{col[tolower($7)]++; if ($2 ~ /holiday inn/) {hic[tolower($7)] += $14; hin[tolower($7)]++;} else if ($1 ~ /hilton/){hc[tolower($7)] += $14; hn[tolower($7)]++;} } END {for (i in col) print "CLEANLINESS " i " " hic[i] / hin[i] " " hc[i] / hn[i]}' $1
gnuplot -persist <<-EOFMarker
set terminal png size 400,300 enhanced font "Helvetica,20"
set output 'graph.png'
set title "Correlation between Cleanliness and overall rating" font ",12" textcolor rgbcolor "royalblue"
set pointsize 1
set datafile separator ','
plot $1 using 16, 10 with linespoints
EOFMarker
