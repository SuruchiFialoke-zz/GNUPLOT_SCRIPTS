reset
# 6in,6in = size
# solid = no dashed lines, only solid ones
# 18 = size of font to use
set term epslatex standalone color colortext size 5in,5in 14 dash header '\usepackage{amsmath}'

set size square

set output '3d.tex'


set zlabel '$\Delta F(N)$' offset 1.0, 0
set ylabel ''
set xlabel '$N$' offset 0,-2
set xrange [0:4900]
set zrange [0:250]
set yrange[0:4]

set ticslevel 0
set xtics 1000 offset 0.0, -1.0
set ytics 1
set view 70,10.0
set palette rgbformulae 33,13,10
#set cbtics 1
#set palette defined (0.0 'orange', 1.0 'red', 2.0 'purple', 3.0 'magenta',4.0 'blue')

unset key
unset colorbox
set ytics format " "
#unset ytics
set samples 1000
splot './free.dat' u 1:3:($2-3):3 with filledcurves lc palette lw 0.5

unset output
set terminal X

!epstopdf 3d-inc.eps
!pdflatex 3d.tex

!rm 3d.aux
!rm 3d.log
!rm 3d.tex
!rm 3d-inc.eps
!rm 3d-inc.pdf
!open 3d.pdf
