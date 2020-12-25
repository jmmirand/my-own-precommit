#!/bin/bash
echo "HOLA MUNDO : " $(pwd) 

curl -o /tmp/gh-md-toc --silents  https://raw.githubusercontent.com/jmmirand-forked/github-markdown-toc/0.7.0/gh-md-toc
chmod +x /tmp/gh-md-toc

for filepath in "$@" 
do
    echo "Username - $i: $filepath";
    i=$((i + 1));
    FILE_LIST="$FILE_LIST $filepath" 
done

echo "LISTA : $FILE_LIST"

/tmp/gh-md-toc $FILE_LIST > README22.md 



