#start gnuplot within docker container
#change directory to subfolder 'gnuplot'

#set gnuplot parameters
reset
set terminal png enhanced
set datafile separator ","
set datafile missing "?"
set style histogram clustered
set boxwidth 0.25 absolute
set style fill solid 
#set key right top vertical Right noreverse enhanced autotitle box lt 1
set xtics (2010, 2011, 2012, 2013, 2014, 2015, 2016)
set xrange [2010:2016]
set yrange [0:]
set xlabel 'Year'
set ylabel 'Average Percent Distribution'
set output 'graph2.png'
set title "Average Percentage Weight Status in Adults per Year\nPlot as Histogram"
plot 'obesity_allyears_overall.csv' using 1:7 smooth unique with boxes notitle lc rgb "red"

