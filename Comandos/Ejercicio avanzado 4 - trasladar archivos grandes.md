# Ejercicio avanzado 4: trasladar archivos grandes

## Dificultad: alta

Este ejercicio es difícil, así que lo plantearemos por iteraciones de complejidad creciente. Todas las versiones deben poder resolverse con una única orden. No se preocupe si no llega a realizar la iteración 4: en la asignatura lo máximo que le podríamos pedir es algo parecido a la versión 3, y normalmente será algo similar a la versión 2.

## Iteración 1
Muestre las rutas todos los ficheros del sistema que midan más de 100MiB y que no hayan sido accedidos en el último mes.

```
find / -size +100M -atime +30
```

## Iteración 2
Elimine todos los ficheros que cumplan con los criterios de la Versión 1.

```
find / -size +100M -atime +30 -exec rm -f {} \;
```

## Iteración 3
Traslade cada uno de esos ficheros a la carpeta */grandes-sin-usar*, cambiando su nombre por fichero.YYYYMMDD, donde fichero es el nombre original y YYYYMMDD es la fecha actual (hoy) en formato año-mes-día. 
Ejemplo: el fichero *penicula.mkv* se traslada a */grandes-sin-usar/penicula.mkv.20151012*.

```
find / -size +100M -atime +30 -exec mv  {} /grandes-sin-usar/{}.(date +%Y%m%d) \;
```

## Iteración 4
Lo mismo que la versión 3, pero el nombre del fichero trasladado debe ser nombre.YYYYMMDD.extensión, donde nombre es el nombre original del fichero sin su extensión, YYYYMMDD es la fecha de último acceso el fichero y extensión son los últimos caracteres del nombre del fichero, después del carácter «.», si existe.
Ejemplo: *penicula.mkv*, accedido por última vez el 7/1/2014, se convertirá en *penicula.20150107.mkv*.

```
 
```
