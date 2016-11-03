# Ejercicio avanzado 3: localizar documentos HTML

## Dificultad: media-alta

Obtenga la lista de todos los directorios del sistema que contienen documentos HTML.

Los documentos HTML son aquellos que tienen extensión *.htm* o *.html*, sin distinguir mayúsculas.

```
ls -R / | grep -E ".+\.htm$|.+\.html$"
```
