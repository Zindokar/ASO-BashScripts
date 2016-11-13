#!/bin/bash
#Autor: Alejandro Lopez Santos
if [ $# -ne 1 ]
then
	R=$(pwd)
else
	R=$1
fi

find $R -type f \( -name "*.doc" -o -name "*.docx" \) | while read origen
do
	destino=$( echo $origen | tr '[:upper:]' '[:lower:]' )
	if [ "$origen" != "$destino" ]
	then
		mv $origen $destino
		echo "$( date --rfc-3339=seconds )\t$origen\t${destino##*/}" >> /var/log/cambiosDoc
	fi
done
