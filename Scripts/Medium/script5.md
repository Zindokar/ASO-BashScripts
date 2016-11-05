## Script 5 - Medium

Escribir un script que permita buscar todos los archivos con extensión “.doc” o “.docx” y normalizar sus nombres, de manera que todos sus caracteres sean letras minúsculas (incluyendo la extensión). Por ejemplo, el archivo “MiFichero.DOCX” debe pasar a ser “mifichero.docx”.

La búsqueda se hará recursivamente desde una ruta inicial **R**, que vendrá dada como argumento al script. Si se omite el argumento, **R** será el directorio actual.

Por cada normalización ejecutada, se añadirá una línea al final del archivo de registro **/var/log/cambiosDoc**, que tendrá la fecha y hora del cambio (en formato RFC 3339 con precisión de segundos, ver NOTA 1), un tabulador, la ruta original del fichero, otro tabulador y el nuevo nombre del fichero (sólo el nombre, sin el directorio). Por ejemplo:

2013-10-16 10:29:43+01:00 /home/pepe/MiFichero.Doc mifichero.doc.

(Pista: aprovechar el programa **tr**)

(**NOTA 1**: Consultar la página de manual de la orden “date” para ver cómo obtener fechas en formato RFC 3339)
