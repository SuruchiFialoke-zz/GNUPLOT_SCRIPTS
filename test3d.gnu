reset
# 6in,6in = size
# solid = no dashed lines, only solid ones
# 18 = size of font to use
#set term epslatex standalone color colortext size 4.5in,4.5in 14 dash header '\usepackage{amsmath}'

set size square
set term wxt
#set output '3d.tex'

set zlabel '$\Delta F(N)$' offset -0.5, 0
set xlabel '$N$' offset 1.5,-2.0
set ylabel '$h_{\mathrm {donut}}$' offset 1.0,-0.5

set xrange [3700:4900]
#set zrange [106:114]
set ztics 20
set ticslevel 0
set view 80,4.00
set xtics 200 offset 0.0, -1.0
set ytics 0.5
set samples 10000
unset key
#set key top right
fit [1500:3700] a*x+b './8h4.5s4w2.PvN' u 1:($3-97) via a,b
fit [3850:3900] a1*x**2+b1*x+c1 './8h4.5s4w2.PvN' u 1:($3-97) via a1,b1,c1
set grid
set isosamples 100
#set arrow 1 from 3700,1.0,106 to 3700,1.0,113.5 nohead lc -1
#set arrow 2 from 4000,1.0,106 to 4000,1.0,113.5 nohead lc -1
#set arrow 3 from 4000,0.0,106 to 4000,0.0,113.5 nohead lc -1

splot \
'./free.dat' u 1:3:($1<3835?($2-97):NaN) ev 3  w p pt 6 ps 2 lt 1 lc 1 lw 2 t '',\
'./free.dat' u 1:3:(($1>3835&&($1<3900))?($2-97):NaN) ev 5  w p pt 6 ps 2 lt 1 lc 2 lw 2 t '',\
'./free.dat' u 1:3:(($1<4375&&($1>3900))?($2-97):NaN) ev 3 w p pt 6 ps 2 lt 1 lc 3 lw 2 t '',\



