#!/bin/bash
#Autor: Alejandro Lopez Santos
if [ $# -ne 1 ]
then
	R="."
else
	R=$1
fi

find $R -type f \( -name "*.doc" -o -name "*.docx" \) | while read origen
do
	destino=$( echo $origen | tr '[:upper:]' '[:lower:]' )
	mv $origen $destino
	echo "$( date --rfc-3339=seconds ) $origen ${destino##*/}" >> /var/log/cambiosDoc
done
