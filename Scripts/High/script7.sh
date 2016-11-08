#!/bin/bash
#Autor: Alejandro Lopez Santos

if [ $# -ne 2 ]
then
	echo "Debe introducir dos directorios como parametros."
	exit 1
fi

function printFilesByPath {
	find $1 -maxdepth 1 -type f | while read file
	do
		fileMatch=$( find $2 -name "${file##*/}" )
		if [ -z $fileMatch ]
		then
			echo $file
		fi
	done
}

printFilesByPath $1 $2
printFilesByPath $2 $1

exit 0
