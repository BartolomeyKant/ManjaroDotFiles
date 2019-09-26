#!/bin/bash

# скрипт для открытия проектов на GO для диссертации
# Нужно просто открыть редактор для дирректории

EDITOR="code"
BASEPATH="$GOPATH/src/kitaev/FMSBuilder/"

#открываем Rofi c параметрами

result=$(find $BASEPATH -maxdepth 1 -type d -regex "$BASEPATH[A-Za-z].*." | RofiDMenu.sh) 

if [[ $result ]]; then
	$EDITOR $result
fi
