#!/bin/bash


if [ "$pc_type" == "work" ]; then  
    cmd.exe /C start firefox "http://127.0.0.1:3000/" "http://localhost:6006/" "http://127.0.0.1:8000/api/admin"
    cmd.exe /C start chrome "http://127.0.0.1:3000/" "http://localhost:6006/"  "http://127.0.0.1:8000/api/admin/" --new-window --window-name="qv" 
else 
    cmd.exe /C start firefox "http://127.0.0.1:3000/"
    cmd.exe /C start chrome "http://127.0.0.1:3000/" --new-window --window-name="qv" 
fi
