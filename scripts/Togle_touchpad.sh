#!/bin/bash

property=$1     # читаем консольные параметры

# получаем текущее состояние тачпада
isTouchEnable=$(synclient -l | grep TouchpadOff)
echo $isTouchEnable
#парсинг параметров
isTouchEnable="${isTouchEnable: -1}"
echo $isTouchEnable

# переключение тачпада
if [[ $isTouchEnable = 0 || $property = Disable ]]; then
  synclient TouchpadOff=1
  killall syndaemon
  notify-send "Сенсорная панель отключена"
else
  synclient TouchpadOff=0
  killall syndaemon
  syndaemon -i 1 -K -R -d
  notify-send "Сенсорная панель включена" 
fi
