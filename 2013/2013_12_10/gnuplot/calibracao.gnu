#!/usr/bin/gnuplot
# Gnuplot script
# Calibracao da sonda de Hall
#

reset
# Constants
mu=pi*4.0e-7	# H/m
Nl=3467.0	# espiras/m
dNl=60.0	# espiras/m
dI=0.01 	# A
dV=1.0		# mV
# Fitting
A=2.618323320637897  # 
B=-0.892931593576278 #

# Functions
f(x) = A*x+B 

# Figure 1 ####################################
#set term wxt 0 enhanced
set terminal svg dashed enhanced font\
 "CMR10,CMEX10" fsize 11 size 600,440
set output "calibracao.svg"

set xlabel ("Campo Magnetico no Solenoide BS (x10-4 T)")
set ylabel ("Tensao de Hall VH (mV)")
set style line 1  lc rgb "#FF0000" lt 1 lw 2
set style line 2  lc rgb "#0000FF" lt 1 lw 2
#set style line 3  lc rgb "#006400" lt 1 lw 3
#set style line 4  lc rgb "#FF8800" lt 1 lw 3
#set style line 5  lc rgb "#000000" lt 1 lw 1
#set xzeroaxis ls 5
#set yzeroaxis ls 5
set key on bottom right

plot [0:46][0:120] 'data_hall' u ($1*Nl*mu*1e4):2:(1e4*sqrt((mu*mu*$1*$1*dNl*dNl+mu*mu*Nl*Nl*dI*dI))) ls 1 title 'dados experimentais' w xerr,\
     f(x) ls 2 title 'recta de calibracao'

#pause -1
