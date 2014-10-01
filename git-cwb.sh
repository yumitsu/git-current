#!/bin/bash

set -f

if [[ -e ".git" && -d ".git" ]]
  then 
  branches=`git branch --no-color`
  read list < <(echo $branches | grep --color=never -P -o '\* [\w\#\-]*')
  list=${list:2}
  echo $list
else
  exit 1
fi

exit 0
