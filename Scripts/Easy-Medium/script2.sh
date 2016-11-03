#!/bin/bash
# Autor: Alejandro Lopez Santos
if [ $# -ne 2 ]
then
	minimo="$(grep -E ^UID_MIN.+ /etc/login.defs)"
	minimo=${minimo#UID_MIN}
	minimo="$(echo $minimo | tr -s " ")"
	maximo="$(grep -E ^UID_MAX.+ /etc/login.defs)"
	maximo=${maximo#UID_MAX}
	maximo="$(echo $maximo | tr -s " ")"
else
	minimo=$1
	maximo=$2
	if [ $maximo -lt $minimo ]
	then
		aux=$minimo
		minimo=$maximo
		maximo=$aux
	fi
fi
while IFS=':' read nombre password iduser idgrupo usuario dir_raiz shell
do
	if [ $iduser -ge $minimo ] && [ $iduser -le $maximo ]
 	then
		echo "$nombre:$iduser:$usuario:$dir_raiz:$shell"
	fi
done</etc/passwd
