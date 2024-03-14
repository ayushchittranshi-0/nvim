#!/bin/bash

pc_type="$pc_type"

if [ "$pc_type" == "work" ]; then  
    cmd.exe /C wt --maximized nt -p "Ubuntu"  --title "tpg" 
    cmd.exe /C wt --maximized nt -p "Ubuntu"  --title "tww" 
    cmd.exe /C start chrome "peerxp.vegaops.com" --new-window --window-name="qg" 
else 
    cmd.exe /C wt --maximized nt -p "Ubuntu"  --title "tpg" 
    cmd.exe /C start chrome "github.com" --new-window --window-name="qg" 
fi

