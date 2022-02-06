#!/bin/bash

# Terminate current instance

# Launch polybar ~/.config/polybar/config
polybar topbar 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched..."
