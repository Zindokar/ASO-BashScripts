## Script 8 - High

Escribir un script que compruebe que los shells asignados a los usuarios del sistema (campo 7 del fichero **/etc/passwd**) aparecen en el fichero **/etc/shells**. Si el shell de algún usuario no aparece en ese fichero, el script debe escribir el nombre del shell en cuestión y debe continuar con la comprobación.

El resultado final del script debe ser una lista (probablemente con elementos repetidos) de todos los shells asignados a los usuarios y que no aparezcan en el fichero **/etc/shells**.