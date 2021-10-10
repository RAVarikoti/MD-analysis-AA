TITLE=6P07
subTITLE=APO-200ns

for i in A B C D E F
do

gnuplot <<EOL
reset
set terminal pngcairo  background "#ffffff" enhanced font "Times-New-Roman-Bold,10" fontscale 1.0 size 1000, 750 
set key on b r inside horizontal
set output 'Chi2Vsns-Protomer$i-COM-ACFexpDecayFit-stretched.png'
set title "{/Symbol c}^2 Vs Time : $TITLE + $subTITLE"

set xlabel "Time (ns)" rotate parallel
set ylabel "{/Symbol c}^2" rotate parallel

set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 5 dt 1 pi 0 ps 1
set style line 5  lt 6 dt 1 pi 0 ps 1
set style line 6  lt 7 dt 1 pi 0 ps 1
set style line 7  lt 8 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

set grid xtics ytics mxtics mytics
set xtics 5
p [0:60][0:] "stat-$i.dat" u 1:2:(0):1 w xerror ps 0 lt 0 lw 1.5 lc "red" t "", \
'' u 1:2 w i lt 0 lw 1.5 lc "red" t "", \
'' u 1:2 w lp pt 7 ps 1.5 lw 2 t "Protomer $i",

EOL

done
###################################### chi2 #############################################################
gnuplot <<EOL
reset
set terminal pngcairo  background "#ffffff" enhanced font "Times-New-Roman-Bold,10" fontscale 1.0 size 1000, 750 
set key on t l inside vertical
set output 'Chi2Vsns-Protomer-all-COM-ACFexpDecayFit-stretched.png'
set title "{/Symbol c}^2 Vs Time : $TITLE + $subTITLE"

set xlabel "Time (ns)" rotate parallel
set ylabel "{/Symbol c}^2" rotate parallel

set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 5 dt 1 pi 0 ps 1
set style line 5  lt 6 dt 1 pi 0 ps 1
set style line 6  lt 7 dt 1 pi 0 ps 1
set style line 7  lt 8 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

set grid xtics ytics mxtics mytics
set xtics 5

p [0:60][0:] "stat-A.dat" u 1:2 w lp pt 7 ps 1.0 lw 2 lt 1 t "Protomer A",\
"stat-B.dat" u 1:2 w lp pt 7 ps 1.0 lw 2 lt 2 t "Protomer B",\
"stat-C.dat" u 1:2 w lp pt 7 ps 1.0 lw 2 lt 3 t "Protomer C",\
"stat-D.dat" u 1:2 w lp pt 7 ps 1.0 lw 2 lt 8 t "Protomer D",\
"stat-E.dat" u 1:2 w lp pt 7 ps 1.0 lw 2 lt 6 t "Protomer E",\
"stat-F.dat" u 1:2 w lp pt 7 ps 1.0 lw 2 lt 7 t "Protomer F",
EOL

################################## tau #################################################

gnuplot <<EOL
reset
set terminal pngcairo  background "#ffffff" enhanced font "Times-New-Roman-Bold,10" fontscale 1.0 size 1000, 750 
set key on t r outside vertical
set output 'tau1Vsns-Protomer-all-COM-ACFexpDecayFit-stretched.png'
set title "{/Symbol t} Vs Time : $TITLE + $subTITLE"

set xlabel "Time (ns)" rotate parallel
set ylabel "{/Symbol t}" rotate parallel

set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 5 dt 1 pi 0 ps 1
set style line 5  lt 6 dt 1 pi 0 ps 1
set style line 6  lt 7 dt 1 pi 0 ps 1
set style line 7  lt 8 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

set label 1 "circle = {/Symbol t}1" at graph 0.75,0.95
set label 2 "cross  = {/Symbol t}2" at graph 0.75,0.90

set grid xtics ytics mxtics mytics
set xtics 5
set logscale y 10
set format y "10^{%L}"

p [0:60][0:]  1 t "" lc rgb "gray",\
"stat-A.dat" u 1:4 w lp pt 6 ps 1.5 lw 2 lt 1 t "Protomer A", '' u 1:5 w lp pt 2 ps 1.2 lw 2 lt 1 t "Protomer A",\
"stat-B.dat" u 1:4 w lp pt 6 ps 1.5 lw 2 lt 2 t "Protomer B", '' u 1:5 w lp pt 2 ps 1.2 lw 2 lt 2 t "Protomer B",\
"stat-C.dat" u 1:4 w lp pt 6 ps 1.5 lw 2 lt 3 t "Protomer C", '' u 1:5 w lp pt 2 ps 1.2 lw 2 lt 3 t "Protomer C",\
"stat-D.dat" u 1:4 w lp pt 6 ps 1.5 lw 2 lt 8 t "Protomer D", '' u 1:5 w lp pt 2 ps 1.2 lw 2 lt 8 t "Protomer D",\
"stat-E.dat" u 1:4 w lp pt 6 ps 1.5 lw 2 lt 6 t "Protomer E", '' u 1:5 w lp pt 2 ps 1.2 lw 2 lt 6 t "Protomer E",\
"stat-F.dat" u 1:4 w lp pt 6 ps 1.5 lw 2 lt 7 t "Protomer F", '' u 1:5 w lp pt 2 ps 1.2 lw 2 lt 7 t "Protomer F"
EOL

################################# Alpha #############################################

gnuplot <<EOL
reset
set terminal pngcairo  background "#ffffff" enhanced font "Times-New-Roman-Bold,10" fontscale 1.0 size 1000, 750 
set key on t l inside vertical
set output 'alphaVsns-Protomer-all-COM-ACFexpDecayFit-stretched.png'
set title "{/Symbol a} Vs Time : $TITLE + $subTITLE"

set xlabel "Time (ns)" rotate parallel
set ylabel "{/Symbol a}" rotate parallel

set style line 1  lt 1 dt 1 pi 0 ps 1 # lt = color; pt = point type; dt = dash type; ps = size  
set style line 2  lt 2 dt 1 pi 0 ps 1
set style line 3  lt 4 dt 1 pi 0 ps 1
set style line 4  lt 5 dt 1 pi 0 ps 1
set style line 5  lt 6 dt 1 pi 0 ps 1
set style line 6  lt 7 dt 1 pi 0 ps 1
set style line 7  lt 8 dt 1 pi 0 ps 1
set style line 8  lt 10 dt 1 pi 0 ps 1

set grid xtics ytics mxtics mytics
set xtics 5

p [0:60][0:]  1 t "" lc rgb "gray",\
"stat-A.dat" u 1:6 w lp pt 7 ps 1.0 lw 2 lt 1 t "Protomer A",\
"stat-B.dat" u 1:6 w lp pt 7 ps 1.0 lw 2 lt 2 t "Protomer B",\
"stat-C.dat" u 1:6 w lp pt 7 ps 1.0 lw 2 lt 3 t "Protomer C",\
"stat-D.dat" u 1:6 w lp pt 7 ps 1.0 lw 2 lt 8 t "Protomer D",\
"stat-E.dat" u 1:6 w lp pt 7 ps 1.0 lw 2 lt 6 t "Protomer E",\
"stat-F.dat" u 1:6 w lp pt 7 ps 1.0 lw 2 lt 7 t "Protomer F"
EOL

