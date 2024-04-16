#!/bin/bash

if [ "$pc_type" == "work" ]; then  
    cmd.exe /C start chrome "youtube.com" --new-window --window-name="fy" 
    # cmd.exe /C start chrome "monkeytype.com" "https://www.edclub.com/sportal" --new-window --window-name="ft" 
    /mnt/c/Users/ayush.chittranshi_pe/AppData/Local/slack/slack.exe
    # /mnt/c/Users/Ayush/AppData/Local/Programs/obsidian/Obsidian.exe
    cmd.exe /C start chrome "chatgpt.peerxp.com" --new-window --window-name="fc" 
    cmd.exe /C start chrome "dev.to" "medium.com" --new-window --window-name="fr" 
    cmd.exe /C start chrome "https://www.notion.so/peerxp/d8a21dc4d75a4eb4ac3991fac56d8dc8?v=dbb336bf51ec4e80b2277f34efcbbfc4" "hr.peerxp.com" "gmail.com" --new-window --window-name="fm"
else 
    # /mnt/c/Users/Ayush/AppData/Local/Programs/obsidian/Obsidian.exe
    cmd.exe /C start chrome "youtube.com" --new-window --window-name="fy" 
    cmd.exe /C start chrome "monkeytype.com" "https://www.edclub.com/sportal" --new-window --window-name="ft" 
    cmd.exe /C start chrome "dev.to" "medium.com" --new-window --window-name="fr" 
    cmd.exe /C start chrome "chat.openai.com" --new-window --window-name="fc" 
fi

