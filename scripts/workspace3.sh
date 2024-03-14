#!/bin/bash

pc_type="$pc_type"

if [ "$pc_type" == "work" ]; then  
    cmd.exe /C start chrome "https://www.notion.so/peerxp/d8a21dc4d75a4eb4ac3991fac56d8dc8?v=dbb336bf51ec4e80b2277f34efcbbfc4" "hr.peerxp.com" "gmail.com" --new-window --window-name="qm"
    /mnt/c/Users/ayush.chittranshi_pe/AppData/Local/slack/slack.exe
    /mnt/c/Users/Ayush/AppData/Local/Programs/obsidian/Obsidian.exe
else 
    /mnt/c/Users/Ayush/AppData/Local/Programs/obsidian/Obsidian.exe
fi

