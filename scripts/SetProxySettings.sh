#!/bin/bash

DefaultProxyState=0  # состояние прокси по умолчанию 0 - нужно включить, 1-нужно отключить

server="proxy"
port="8080"

currentMode=$(gsettings get org.gnome.system.proxy mode)
echo $currentMode
if [[ $currentMode != "'manual'" ]]; then
  # включние настроек прокси
  gsettings set org.gnome.system.proxy mode 'manual'
  
  notify-send "Включен ручной режим задания настроек прокси Server: $server Port: $port"
  
  export {http,https}_proxy="http://"$server":"$port"/"
  export ftp_proxy="ftp://"$server":"$port"/"
   
  export {HTTP,HTTPS}_PROXY=$http_proxy
  export FTP_PROXY=$ftp_proxy
else
    # отключение настроек прокси
  gsettings set org.gnome.system.proxy mode 'auto'
  
  notify-send "Включен автоматический режим получения настроек прокси"
  
  unset {http,https}_proxy
  unset ftp_proxy
  unset {HTTP,HTTPS}_PROXY
  unset FTP_PROXY
fi
