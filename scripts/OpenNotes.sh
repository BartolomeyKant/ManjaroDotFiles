#!/bin/bash

#открытие записок по разным темам 
NOTEDIR="$HOME/Documents/MyFiles/Notes/"			#дирректория с заметками
EDITOR="code"
createnew="Create new"
function setcommands {
	echo $createnew
	find $NOTEDIR -maxdepth 1 -type d -regex "$NOTEDIR[A-Za-zА-Яа-я].*."
}

result=$(setcommands|RofiDMenu.sh)

if [[ $result ]]; then

	if [[ $result == $createnew ]]; then
		#Создаем новую заметку
		newName=$(RofiDMenu.sh "Новая_заметка")
		if [[ newName == "" ]]; then
			newName="New Note"
       	 	fi
		/bin/cp -r $NOTEDIR.templatenote $NOTEDIR"$newName"
		$EDITOR $NOTEDIR"$newName"
	else
		$EDITOR "$result"
	fi
fi
