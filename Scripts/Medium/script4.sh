#!/bin/bash
#Autor: Alejandro Lopez Santos
if [ $# -ne 1 ]
then
	R="."
else
	R=$1
fi

for archivo in $( find $R -type f -name "*.cpp" )
do
	nombreBase=$( basename $archivo )
	ruta=${archivo%/*}
	nombreFinal=${nombreBase%cpp}"cc"
	$( mv $archivo "$ruta/$nombreFinal" )
done