#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#получения основного и резервного монитора
export PRIMMON=$(GetMonitor.sh pri)
export SECMON=$(GetMonitor.sh sec)

# Launch bar top
polybar top &
polybar network_bar &
polybar system_stats_bar &

echo "Bars launched..."
