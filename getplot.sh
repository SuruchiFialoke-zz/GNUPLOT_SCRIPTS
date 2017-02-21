#!/bin/bash
Nrange=$(seq 90 -2 30)
index=10
for i in $Nrange 
do
    	echo $index	
	sed "s/XXX/$i/g" shaded_temp.gnu > N$i.gnu
    	gnuplot -persist < N$i.gnu
    	echo $i
    	mv $i.png $index.png
    	rm N$i.gnu
   	: $((index = $index + 1))
done
~   
