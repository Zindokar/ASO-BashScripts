# BLOQUE B: ejercicios con ps (procesos)

Estos son varios ejercicios que se pueden resolver con la orden ps y, en ciertos casos, combinados con algún filtro estándar.

Entregue sus soluciones respondiendo a este mismo mensaje del foro.

## Ejercicio 1
Muestre el tiempo transcurrido desde su lanzamiento, el PID y la orden de todos los procesos que se están ejecutando en el sistema.
```
ps -eo pid,time,command
```

## Ejercicio 2
Muestre el pid y el propietario de todos los procesos que estén ejecutando el programa bash. La lista debe estar ordenada por el nombre del propietario.
```
ps -o user,pid -C bash --sort=user
```

## Ejercicio 3
3. ¿Qué hace la siguiente orden?
```
ps -e --forest
```
Muestra un árbol de procesos con sus hijos en forma de rama que están ejecutándose en el sistema.

## Ejercicio 4
¿Qué hace la siguiente orden?
```
ps -e -opid,ppid,user,pcpu,cputime,cmd --sort=cputime
```
Ordena los procesos del sistema de forma ascendente por el tiempo que llevan en ejecución.

## Ejercicio 5
Localice los 5 procesos que más memoria están consumiendo.
```
ps -eo pid,%mem --sort=%mem | tail -n 5
```
