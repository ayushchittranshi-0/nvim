#!/bin/bash

if [ "$pc_type" == "work" ]; then  
    cmd.exe /C wt --maximized nt -p "Ubuntu"  --title "jpg" 
    cmd.exe /C wt --maximized nt -p "Ubuntu"  --title "jww" 
    cmd.exe /C wt --maximized nt -p "Ubuntu"  --title "jnt" 
    cmd.exe /C start chrome "peerxp.vegaops.com" --new-window --window-name="fg" 
else 
    cmd.exe /C wt --maximized nt -p "Ubuntu"  --title "jpg" 
    cmd.exe /C wt --maximized nt -p "Ubuntu"  --title "jnt"
    cmd.exe /C start chrome "github.com" --new-window --window-name="fg" 
fi

