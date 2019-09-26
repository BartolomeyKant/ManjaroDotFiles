#!/bin/bash

#функция поиска подключенных мониторов
#печатает в стандартный вывод имя подключенного монитора


usage="/--------------------------------------------------\n
Usage: $0 <pri|sec>\n
pri -  print prymary monitor name\n
sec - print first secondary monitor name\n
---------------------------------------------------------/"

if [[ -z $1 ]]; then
	echo -e  $usage
elif [[ $1 == "pri" ]]; then
	monitor=$(xrandr | grep -w connected | grep -w primary) #  монитор подключен и содержит  primary
elif [[ $1 == "sec" ]]; then
	monitor=$(xrandr | grep -w connected | grep -v primary)	#  монитор подключен и не содержит  primary
else
	echo -e $usage
fi

if [[ $monitor ]]; then
	#нужно получить только название монитора
	words=($monitor)
	echo ${words[0]}
fi

