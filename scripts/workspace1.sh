#!/bin/bash


if [ "$pc_type" == "work" ]; then  
    cmd.exe /C start chrome "chatgpt.peerxp.com" --new-window --window-name="qc" 
    cmd.exe /C start chrome "youtube.com" "https://www.edclub.com/signin" --new-window --window-name="qp" 
    cmd.exe /C start firefox "http://127.0.0.1:3000/" "http://localhost:6006/" "http://127.0.0.1:8000/api/admin"
    cmd.exe /C start chrome "http://127.0.0.1:3000/" "http://localhost:6006/"  "http://127.0.0.1:8000/api/admin/" --new-window --window-name="qv" 
    cmd.exe /C start chrome "google.com" --new-window --window-name="qr" 
else 
    cmd.exe /C start chrome "chatgpt.peerxp.com" --new-window --window-name="qc" 
    cmd.exe /C start chrome "youtube.com" "https://www.edclub.com/signin" --new-window --window-name="qp" 
    cmd.exe /C start firefox "http://127.0.0.1:3000/"
    cmd.exe /C start chrome "http://127.0.0.1:3000/" --new-window --window-name="qv" 
    cmd.exe /C start chrome "google.com" --new-window --window-name="qr" 
fi
