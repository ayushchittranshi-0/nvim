#!/bin/bash

pc_type="$pc_type"

if [ "$pc_type" == "work" ]; then  
    cmd.exe /C start chrome "chatgpt.peerxp.com" --new-window --window-name="qc" 
    cmd.exe /C start chrome "youtube.com" "https://www.edclub.com/signin" --new-window --window-name="qp" 
    cmd.exe /C start firefox "http://127.0.0.1:3000/" "http://localhost:6006/"
    cmd.exe /C start chrome "http://127.0.0.1:3000/" "http://localhost:6006/" --new-window --window-name="qv" 
    cmd.exe /C start chrome "google.com" --new-window --window-name="qr" 
else 
    cmd.exe /C start chrome "chatgpt.peerxp.com" --new-window --window-name="qc" 
    cmd.exe /C start chrome "youtube.com" "https://www.edclub.com/signin" --new-window --window-name="qp" 
    cmd.exe /C start firefox "http://127.0.0.1:3000/"
    cmd.exe /C start chrome "http://127.0.0.1:3000/" --new-window --window-name="qv" 
    cmd.exe /C start chrome "google.com" --new-window --window-name="qr" 
fi

