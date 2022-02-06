#!/bin/bash

# get the current window manager name
checkWindowManager () {
  local window=$(
    xprop -root -notype
  )

  local identifier=$(
    echo "${window}" |
    awk '$1=="_NET_SUPPORTING_WM_CHECK:"{print $5}'
  )

  local attributes=$(
    xprop -id "${identifier}" -notype -f _NET_WM_NAME 8t
  )

  local name=$(
    echo "${attributes}" |
    grep "_NET_WM_NAME = " |
    cut --delimiter=' ' --fields=3 |
    cut --delimiter='"' --fields=2
  )

  echo "${name}"
}

CURRENT_WM=$(checkWindowManager)

if [ $CURRENT_WM == 'Metacity' ]; then

  # quit metacity
  killall metacity
  echo "%{F#ffffff}Tiling%{u-}"

  # quit & start browser for window decorations
  killall chrome
  google-chrome-stable 2> /dev/null & disown google-chrome-stable

elif [ $CURRENT_WM == 'herbstluftwm' ]; then

  # quit herbstluftwm
  killall herbstluftwm
  echo "%{F#ffffff}Floating%{u-}"

  # quit & start browser for window decorations
  killall chrome
  google-chrome-stable 2> /dev/null & disown google-chrome-stable

fi