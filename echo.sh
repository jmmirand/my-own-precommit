#!/bin/bash
echo "HOLA MUNDO" 

for user in "$@" 
do
    echo "Username - $i: $user";
    i=$((i + 1));
done
