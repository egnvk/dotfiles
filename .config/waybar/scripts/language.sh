#!/bin/bash
layout=$(swaymsg -t get_inputs 2>/dev/null | grep -oP '"xkb_active_layout_name": "\K[^"]+' | head -1)
case "$layout" in
    English*) echo "en" ;;
    Russian*) echo "ru" ;;
    *) echo "${layout:0:2}" ;;
esac
