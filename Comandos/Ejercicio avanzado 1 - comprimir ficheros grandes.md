# Ejercicio avanzado 1: comprimir ficheros grandes

## Dificultad: media 

Comprima con gzip cada uno de los ficheros mayores de 10 KiB que existan bajo el directorio actual, de manera que cada fichero mayor de 10 KiB sea reemplazado por su versión comprimida.

```
find . -type f -size +10k -exec gzip {} \;
```
