#!/bin/bash

function R {
while read line
do
	echo "Вот эта " $line
done
}

R | rofi -dmenu

