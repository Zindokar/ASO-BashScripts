#!/bin/bash
#Autor: Alejandro Lopez Santos
if [ $# -ne 1 ]
then
	echo "Debe introducir un parametro numerico."
	exit 0
fi
echo "Buscando ficheros en el sistema....."
echo "--------"
$( find /home -type f -exec stat -c '%U' {} \; | uniq -c | tr -s " " > auxFile.txt )
exec 3<auxFile.txt
while IFS=' ' read -u 3 numFicheros usuario
do
	if [ $numFicheros -ge $1 ]
	then
		echo "$numFicheros ficheros pertenecen al usuario $usuario."
	fi
done
$( rm -f auxFile.txt )
echo "--------"
echo "Ejecución completa."
exit 1