# BLOQUE B ejercicios con find

Estos son varios ejercicios que se pueden resolver fácilmente con la orden **find**. 

Envíe sus soluciones respondiendo directamente a este mensaje.

En el contexto de este bloque  de ejercicios se entenderá que el término "fichero" se refiere a un fichero regular, mientras que "archivo" se refiere a cualquier entidad del sistema de ficheros (archivo, directorio, enlace, ...).

## Ejercicio 1
¿Qué hace la siguiente orden?
```
find /etc /boot -type f -newer /etc/passwd
```
Busca en /etc y /boot archivos (no carpetas) más recientes que /etc/passwd

## Ejercicio 2
Localice todos los archivos que no pertenezcan al usuario root cuyo tamaño sea mayor que 10 KiB y menor que 50 KiB
```
find / ! -user root \( -size +10k -a -size -50k \)
```

## Ejercicio 3
Muestre el tipo de todos los ficheros que encuentre bajo el directorio /home (pista: orden 'file')
```
find /home -exec file {} \;
```

## Ejercicio 4
Localice todos los archivos del directorio /root que tengan permiso de lectura para el grupo propietario, independientemente del resto de permisos.
```
find /root -exec ls -l {} \; | grep -E "^.{4}r.+"
```

## Ejercicio 5
¿Qué hace la siguiente orden?
```
cd ; find . -maxdepth 1 -empty
```
Se mueve al directorio por defecto del usuario, busca en el directorio actual como máximo 1 directorio de profundidad del actual, las carpetas vacías.
