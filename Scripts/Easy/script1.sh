#!/bin/bash
# Autor: Alejandro Lopez Santos
if [ $# -lt 2 ]
then
	echo "Debe usarse con dos parametros: "
	echo "Primero: -p o -i para mostrar lineas pares o impares."
	echo "Segundo o mas: ficheros a leer."
	exit 0
fi
condicion=$1
shift
if [ $condicion == "-p" ] || [ $condicion == "-i" ]
then
	while [ $# != 0 ]
	do
		exec 3<$1
		cont=1
		while read -u 3 text
		do
			if [ $(( $cont % 2 )) -eq 0 ] && [ $condicion == "-p" ]
			then
				echo $text
			fi
			if [ $(( $cont % 2 )) -ne 0 ] && [ $condicion == "-i" ]
			then
				echo $text
			fi
			cont=$(( $cont + 1 ))
		done
		shift
	done
	exit 1
else
	echo "Primer parametro incorrecto."
	echo "Primero: -p o -i para mostrar lineas pares o impares."
	exit 0
fi
