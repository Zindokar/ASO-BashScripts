#!/bin/bash
#Autor: Alejandro Lopez Santos
if [ $# -ne 1 ]
then
	echo "Debe introducir un parametro numerico."
	exit 0
fi
echo "Buscando ficheros en el sistema....."
echo "--------"
find / -type f -printf "%u\n" | sort | uniq -c | tr -s " " | while IFS=' ' read numFicheros usuario
do
	if [ $numFicheros -ge $1 ]
	then
		echo "$numFicheros ficheros pertenecen al usuario $usuario."
	fi
done
echo "--------"
echo "Ejecución completa."
exit 1