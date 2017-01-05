	#!/bin/bash
	
	if [ $# -ne 1 ]
	then
		echo "Uso incorrecto. Indique como único parámetro el valor máximo de intentos de autentificación de los usuarios." >&2
		exit 1
	fi

	LANG=en		# Usado para el correcto formateado y trato de fechas
	threshold=$1

	# Controlamos si estamos en la primera ejecución del script
	if [ -f /var/log/login_unsuccessful ]
	then
		fechaUltimaEjecucion=$(date -d "$(tail -n 1 /var/log/login_unsuccessful)" +%s)
	else
		fechaUltimaEjecucion=-1
	fi
	
	grep "authentication failure;" /var/log/secure | (while read linea
	do
		fechaLinea=$( echo $linea | cut -c 1-15 )
		fechaLineaSegundos=$( date -d "$fechaLinea" +%s )
		if [ $fechaLineaSegundos -gt $fechaUltimaEjecucion ]
		then
			echo $linea | cut -d "=" -f 8 >> /var/ultimosAccesosUsuarios
		fi
	done)
	
	# Si se ha encontrado algún intento de acceso tras la última ejecución del script, los tratamos:
	if [ -f /var/ultimosAccesosUsuarios ]
	then
		IFS=" "
		sort /var/ultimosAccesosUsuarios | uniq -c | tr -s " " | while read ocurrencia usuario
		do
			if [ $ocurrencia -gt $threshold ]
			then
				if [ ! -z $usuario ]    # Para controlar usuarios con nombre en blanco
				then
					uidActual=$( grep "^$usuario" /etc/passwd | cut -d ":" -f 3 )
					uidMinimo=$(grep "UID_MIN" /etc/login.defs | awk '{print $2}')
					if [ $uidActual -ge $uidMinimo ] || [ $uidActual -eq 0 ]
					then
                        # Comienza parte adicional --------------------------
						acccountExpire=$(chage -l $usuario | grep "Account expires" | awk '{print $4}')
						passwordExpire=$(chage -l $usuario | grep "Password expires" | awk '{print $4}')
						if [ $acccountExpire = "never" ] 
						then
							if [ $passwordExpire = "never" ]
							then
							    echo "$usuario (fallos = $ocurrencia) (cuenta nunca expira, contraseña nunca expira)" >> /var/log/login_unsuccessful
							else
							    echo "$usuario (fallos = $ocurrencia) (cuenta nunca expira)" >> /var/log/login_unsuccessful
							fi
						elif [ $passwordExpire = "never" ]
						then
							if [ $acccountExpire = "never" ]
							then
							    echo "$usuario (fallos = $ocurrencia) (cuenta nunca expira, contraseña nunca expira)" >> /var/log/login_unsuccessful
							else
							    echo "$usuario (fallos = $ocurrencia) (contraseña nunca expira)" >> /var/log/login_unsuccessful
							fi
						# Termina parte adicional --------------------------
						else
						    echo "$usuario (fallos = $ocurrencia)" >> /var/log/login_unsuccessful # Parte normal
						fi
					fi
				fi
			fi
		done
		
		# Eliminamos el fichero auxiliar para prepararlo para la próxima ejecución del script
		rm -f /var/ultimosAccesosUsuarios
	fi
	
	# Se incluye la fecha de la última ejecución del script al final del fichero de salida
	date "+%b %d %H:%M:%S" >>/var/log/login_unsuccessful
