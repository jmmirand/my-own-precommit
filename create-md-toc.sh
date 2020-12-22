#!/bin/bash
echo "HOLA MUNDO" 

for filepath in "$@" 
do
    echo "Username - $i: $filepath";
    i=$((i + 1));
    FILE_LIST="$FILE_LIST $filepath" 
done

echo "LISTA : $FILE_LIST"

gh-md-toc $FILE_LIST > README22.md 



