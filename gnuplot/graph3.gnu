#change directory to subfolder 'gnuplot'
#start gnuplot within docker container

#set gnuplot parameters
reset
set terminal png enhanced
set datafile separator ","
set datafile missing "?"

set xlabel 'Year'
set ylabel '(%) Percentage of Adults'
set xrange [2010:2016]
set yrange [10:]
set grid
set key left bottom vertical Right noreverse enhanced autotitle nobox
set xtics (2010, 2011, 2012, 2013, 2014, 2015, 2016)
set style line 1 lc rgb "red"
set style line 2 lc rgb "green"
set style line 3 lc rgb "blue"
set style line 4 lc rgb "cyan"
set style line 5 lc rgb "yellow"
set style line 6 lc rgb "purple"

set output 'graph3.png'

set title '% Obesity/Weight Status in Adults for New England States by Year'

plot 'newengland_overall.csv' using 1:(stringcolumn(3) eq "CT"? column(7):1/0) with points ls 1 title "CT", \
     '' u 1:(stringcolumn(3) eq "ME"? column(7):1/0) with points ls 2 title "ME", \
     '' u 1:(stringcolumn(3) eq "MA"? column(7):1/0) with points ls 3 title "MA", \
     '' u 1:(stringcolumn(3) eq "NH"? column(7):1/0) with points ls 4 title "NH", \
     '' u 1:(stringcolumn(3) eq "RI"? column(7):1/0) with points ls 5 title "RI", \
     '' u 1:(stringcolumn(3) eq "VT"? column(7):1/0) with points ls 6 title "VT"

