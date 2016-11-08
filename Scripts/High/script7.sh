#!/bin/bash
#Autor: Alejandro Lopez Santos

if [ $# -ne 2 ]
then
	echo "Debe introducir dos directorios como parametros."
	exit 1
fi

find $1 -maxdepth 1 -type f | while read file
do
	fileMatch=$( find $2 -name "${file##*/}" )
	if [ -z $fileMatch ]
	then
		echo $file
	fi
done

find $2 -maxdepth 1 -type f | while read file
do
	fileMatch=$( find $1 -name "${file##*/}" )
	if [ -z $fileMatch ]
	then
		echo $file
	fi
done

exit 0
