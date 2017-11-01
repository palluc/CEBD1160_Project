#change directory to subfolder 'gnuplot'
#start gnuplot within docker container

#set gnuplot parameters

reset
set terminal png enhanced
set datafile separator ","
set datafile missing "?"
set boxwidth 0.5 absolute
set style fill solid 1.0 noborder
set style histogram clustered gap 1 title offset character 0, 0, 0
set style data histograms
set yrange [0:]
set xlabel '% of adults aged >=18 years who have overweight/obesity'
set ylabel 'Frequency Distribution'
set xtics 19.0, 2.5, 40.0

#define macro function "rounded" for frequency count
bin_width = 1
bin_number(x) = floor(x/bin_width)
rounded(x) = bin_width * ( bin_number(x) + 0.5 )

set output 'graph1.png'
set title "Percentage Frequency of Weight Status in Adults for Year 2015\nPlot as Histogram"
plot "obesity_overall.csv" \
   using (rounded($7)):(1) smooth frequency with boxes notitle lc rgb "blue"

