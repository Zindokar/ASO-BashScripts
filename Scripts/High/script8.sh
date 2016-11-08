#!/bin/bash
#Autor:Alejandro Lopez Santos
cut -d ":" -f 7 /etc/passwd | while read bashOption
do
    isFound=$( grep $bashOption /etc/shells )
    if [ -z $isFound ]
    then
        echo $bashOption
    fi
done
