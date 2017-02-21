#!/usr/bin/gnuplot
reset

# wxt
# set terminal wxt size 1600,1600 enhanced font 'Verdana,20' persist
# png
set terminal pngcairo size 800,800 enhanced font 'Verdana,14'
set output 'XXX.png'
set border linewidth 1.5


#Axes
set zlabel '' offset 1.0, 0
set ylabel ''
set xlabel 'N' offset 0,-2
set xrange [0:4900]
set zrange [0:250]
set yrange[0:4]

set ticslevel 0
set xtics 1000 offset 0.0, -1.0 out
set ytics 1 out
set ytics format " "
set ztics 50 out

#View 60 2
set view XXX,2

#key
unset key
unset colorbox
set sample 5000
set border 4095

#plot
splot \
(x<=3835 && x>10 ? 250 : 1/0) w boxes lc rgb "#fb9a99" t '',\
(x>=3835 && x<=3915 ? 250 : 1/0) w filledcu lc rgb "#fcbba1" t '',\
(x>=3915 && x<=4376 ? 250 : 1/0) w filledcu lc rgb "#addd8e" t '',\
(x>=4376 && x<=4590 ? 250 : 1/0) w filledcu lc rgb "#b3cde3" t '',\
(x>=4590? 250 : 1/0) w filledcu lc rgb "#cab2d6" t '',\
'./free.dat' u 1:3:($2-3) ev 2 w p lc 7 lw 2 ps 2 t ''

