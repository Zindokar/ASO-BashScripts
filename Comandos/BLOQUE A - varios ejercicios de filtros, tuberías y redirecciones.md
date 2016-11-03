# BLOQUE A: varios ejercicios de filtros, tuberías y redirecciones

Estos son ocho ejercicios para practicar con filtros, tuberías y redirecciones. En algunos enunciados se da una pista sobre las órdenes principales que pueden ayudar a resolver el ejercicio con eficacia. 

Tenga en cuenta que cada ejercicio se puede resolver de muchas formas distintas, no sólo la propuesta en la pista. Si usted encuentra una forma de resolverlo con órdenes distintas a las recomendadas, adelante con ello.

Para entregar su solución, responda al mensaje en este mismo foro.

## Ejercicio 1:
¿Qué hace la siguiente orden?
```
date > /tmp/foo.txt ; who >> /tmp/foo.txt
```
El comando **date** muestra la fecha software del sistema y la guarda en el archivo **/tmp/foo.txt** con la redirección **>**, el **;** separa las instrucciones para que se ejecuten de forma secuencial en orden de izquierda a derecha, finalmente se redirige la salida del comando **who** al archivo **/tmp/foo.txt** pero al final del fichero ya que utiliza la redirección **>>**.

¿Cuál es la diferencia con esta otra orden?
```
date > /tmp/foo.txt ; who > /tmp/foo.txt
```
En este caso la salida del comando **who** machaca la salida del comando date ya que la redirección > busca el archivo y lo machaca.

## Ejercicio 2:
¿Qué hace la siguiente orden?
```
ls -lR /boot 2> /tmp/fichA > /tmp/fichB
```
Escribe los directorios y ficheros de forma recursiva y con información extra por el **-l** en el fichero **/tmp/fichB** y si hay algún error (de stderr) se escribe en el archivo **/tmp/fichA**

## Ejercicio 3:
Combinando las órdenes head y tail, muestre la sexta línea del fichero /etc/passwd
```
head -n 6 /etc/passwd | tail -n 1
```

## Ejercicio 4:
Contar el número de ficheros del directorio /boot (y sólo /boot, sin recursividad)  cuyo nombre contenga una o más letras mayúsculas (pista: grep, wc)
```
ls -l /boot | grep -E [A-Z]+ | wc -l
```

## Ejercicio 5:
Cada usuario del sistema tiene asignado un shell por defecto (último campo del fichero /etc/passwd). Escriba una lista ordenada alfabéticamente de los nombres de usuario (login name) que usan /bin/bash como shell por defecto (pista: cut, grep, sort)
```
cat /etc/passwd | grep /bin/bash | cut -d : -f 1 | sort
```

## Ejercicio 6:
¿Qué hace la siguiente orden? Modifíquela para que sea más eficiente
```
cat /etc/group | sort -t: -k1 | cut -d: -f1,3
```
Quiere mostrar los grupos ordenados por el primer campo y mostrar los campos 1 al 2, la óptima sería:
```
cut -d : -f 1,3 /etc/group | sort -t : -k 1
```

## Ejercicio 7:
Enumere los shells que usan los usuarios de su sistema, sin que haya repeticiones (pista: sort y uniq)
```
sort /etc/passwd -t : -k 7 -u
```