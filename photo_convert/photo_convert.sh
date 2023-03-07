#!/bin/bash

# check if a folder argument as been passed
# ./ to use the script in current directory
if test -z $0 ; then
  echo "No argmument provided."
  echo "./ as first arg to use in current directory."

else # if arg provided then --> / program /

# ------------------------------------------------
# PART 1 : Remove space from files & folders names
# ------------------------------------------------

  IFS=$'\n' #disable spliting str when a whitespace is encountered
  for filename in $(find $1)
  do
    if [[ "$filename" != "$(echo $filename | tr ' ' _)" ]]; then #if filename as whitespace then rename it
      mv $filename "$(echo $filename | tr ' ' _)" 
    fi
  done
# ------------------------------------------------------
# PART 2 : New directory with every img converted to png
# ------------------------------------------------------
  if $(find | grep 'photos.png') != ""; then
    mkdir photos.png
  
  cp ./$1/* photos.png/

  for filename in $(find ./photos.png/*.jpg)
    do
      mv -- "filename" "${filename%.jpg}.png"
    done

  for filename in $(find photos.png/*.jpeg)
    do
      mv -- "filename" "${filename%.jpeg}.png"
    done
  fi
fi
