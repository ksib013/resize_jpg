#!/bin/bash
IFS=$'\n'
if [ -n "$1" ]
then
files=( $(cat "./$1") )
i=0
    for i in "${files[@]}"
    do
	if [ -f "$i" -a "${i: -4}" == ".jpg" ]
	then
	wid=( $(identify -format %W "$i") )
	hei=( $(identify -format %H "$i") )
		if [ "$wid" -gt "360" -o "$hei" -gt "360" ]
		then convert -resize 360x360\> "$i" "${i%.jpg}_thumbnail.jpg"
		fi
	fi
    done
else

    for f in *.jpg
    do
	wid=( $(identify -format %W "$f") )
	hei=( $(identify -format %H "$f") )
	if [ "$wid" -gt "360" -o "$hei" -gt "360" ]
	then convert -resize 360x360\> "$f" "${f%.jpg}_thumbnail.jpg"
	fi
    done
fi