#!/bin/bash

case $1 in
    -h | --help ) echo "usage: $(basename $0) PATH"; exit;;
esac

if [ $# -ne 1 ]; then
    echo "error: wrong number of arguments" 1>&2
    exit 1
fi

path=$1

if [ ! -d "$path" ]; then
    echo "error: '$path' is not a directory" 1>&2
    exit 1
fi

echo $(ls $path | wc -l) entries

echo biggest file : $(ls -lhS $path | head -2 | tail -1)
echo smallest file: $(ls -lhrS $path | head -2 | tail -1)
