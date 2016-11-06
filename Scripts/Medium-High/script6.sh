#!/bin/bash
#Autor: Alejandro Lopez Santos

if [ $# -lt 2 ]
then
	echo "Debe introducir al menos dos parametros."
	exit 1
fi

fileLinesList=()
for files in "$@"
do
	fileLinesList+=($( wc -l $files| cut -d " " -f 1 ))
done

maxFileLines=0
for fileCount in "${fileLinesList[@]}"
do
	if [ $maxFileLines -lt $fileCount ]
	then
		maxFileLines=$fileCount
	fi
done

for count in $(seq 1 $maxFileLines)
do
	for files in "$@"
	do
		sed -n "${count}p" $files
	done
done

exit 0
