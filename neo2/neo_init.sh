#! /usr/bin/zsh

# this command start neo as the first keyboard layout with
# correct 4th and 6th layers and the normal german keyboard
# as second layers

#setxkbmap -layout de,de -variant neo,basic

#to only set neo
setxkbmap -layout de -variant neo

xset r rate 150 55
