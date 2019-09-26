#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#получения основного и резервного монитора
export PRIMMON=$(GetMonitor.sh pri)
export SECMON=$(GetMonitor.sh sec)

# Launch bar1 and bar2

polybar -c $HOME/.config/i3/polybar_config workspaces_tray -r &
polybar -c $HOME/.config/i3/polybar_config music_tray2 -r &

polybar -c $HOME/.config/i3/polybar_config workspaces_tray2 -r &

#polybar bar2 &

echo "Bars launched..."
