#!/usr/bin/env bash

# Terminate already running bar instances
pkill polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar dp1 >&1 | tee -a /tmp/polybar1.log & disown
polybar dp2 >&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
