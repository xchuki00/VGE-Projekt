#!/usr/bin/bash
# do autu je potreba zadat adresu k z buildnute utilite metro z vcglib
out=$(~/vge/vcglib/vcglib/apps/build/metro/metro $1 $2)
arr=$(echo $out | grep -oP 'mean : [0-9.]*')
array=(${arr//:/ })
echo ${array[1]}
