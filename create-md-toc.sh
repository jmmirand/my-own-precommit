#!/bin/bash
function multi_toc_readme(){
  echo "Starting multi_toc_readme..."

  local toc=$(gh-md-toc no_backup $(ls -d ./doc/*))
  local readme_path="./README.md"
  local ts="<\!--ts-->"
  local te="<\!--te-->"
  local dt=`date +'%F_%H%M%S'`
  local ext=".orig.${dt}"
  local toc_path="${readme_path}.toc.${dt}"
  local toc_footer="<!-- Added by: `whoami`, at: `date` -->"

  # clear old TOC
  sed -i${ext} "/${ts}/,/${te}/{//!d;}" "$readme_path"

  # create toc file
  echo "${toc}" > "${toc_path}"
  echo -e "\n${toc_footer}\n" >> "$toc_path"
  # insert toc file
  if [[ "`uname`" == "Darwin" ]]; then
      sed -i "" "/${ts}/r ${toc_path}" "$readme_path"
  else
      sed -i "/${ts}/r ${toc_path}" "$readme_path"
  fi

  # delete temporal file
  rm ${toc_path} ${readme_path}.orig.*
}

curl -o /tmp/gh-md-toc --silent  https://raw.githubusercontent.com/jmmirand-forked/github-markdown-toc/0.7.0/gh-md-toc
chmod +x /tmp/gh-md-toc

for filepath in "$@"
do
    FILE_LIST="$FILE_LIST $filepath"
done

multi_toc_readme

# toc=$(gh-md-toc $(ls -d ./doc/*))
# templ=$(<README-TEMPLATE.md)
# value=$(gh-md-toc $(ls -d ./doc/*))
# echo "${templ//<!-- mytoc -->/$value}" > README.md
