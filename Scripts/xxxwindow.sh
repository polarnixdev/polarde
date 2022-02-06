#!/bin/bash

WM_DESKTOP=$(xdotool getwindowfocus)

if [ $WM_DESKTOP == "10485770" ]; then
	echo " "

elif [ $WM_DESKTOP != "1883" ]; then

	WM_CLASS=$(xprop -id $(xdotool getactivewindow) WM_CLASS | awk 'NF {print $NF}' | sed 's/"/ /g')
	WM_NAME=$(xprop -id $(xdotool getactivewindow) WM_NAME | cut -d '=' -f 2 | awk -F\" '{ print $2 }')

	if [ $WM_CLASS == 'Gnome-terminal' ]; then
		echo "%{F#ffffff}Terminal%{u-}"
	
	elif [ $WM_CLASS == 'discord' ]; then
		echo "%{F#ffffff}Discord%{u-}"

	elif [ $WM_CLASS == 'Google-chrome' ]; then
		echo "%{F#ffffff}Google Chrome%{u-}"

	elif [ $WM_CLASS == 'Element' ]; then
		echo "%{F#ffffff}Element%{u-}"

	elif [ $WM_CLASS == 'code-oss' ]; then
		echo "%{F#ffffff}Visual Studio Code%{u-}"
	
	# elif [ $WM_NAME == 'Enter WM_NAME value here' ]; then
	# 	echo "%{F#ffffff}Custom name%{u-}"

	else
		echo "%{F#ffffff}$WM_NAME%{u-}"
	fi

fi
