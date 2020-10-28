#set terminal x11
set terminal svg size 800,400 enhanced 
set output 'helmholtz.svg'

set style line 1 lc rgb "#000000" pt 1 ps 1
set style line 2 lc rgb "#000000" pt 2 ps 1
set style line 3 lc rgb "#000000" pt 7 ps 1
set style line 4 lc rgb "#000000" pt 4 ps 1
set style line 12 lc rgb '#888888' lt 1 lw 2
set style line 13 lc rgb '#888888' lt 2 lw 1

set grid xtics ytics mxtics mytics ls 12, ls 13
set mxtics 10
set mytics 10
set yrange[-40:60]
set xrange[-1:19]
set xlabel "x  (cm)"
set ylabel "V_H  (mV)"
xoffset=-23.0

plot "helmholtz.dat" u ($1+xoffset):2 ls 1 title "bobina 1",\
                  "" u ($1+xoffset):3 ls 2 title "bobina 2",\
                  "" u ($1+xoffset):4 ls 3 title "bobina 1+2",\
                  "" u ($1+xoffset):5 ls 4 title "bobina -1+2"
