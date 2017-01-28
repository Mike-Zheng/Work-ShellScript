#!/bin/bash
echo "工作腳本"
echo "請輸入密碼"
read -s password

#先把sublime叫起床
osascript -e 'tell application "Sublime Text"
    activate
end tell'

#開啟mongo資料庫
osascript -e 'tell app "Terminal"
    do script "echo '"$password"' | sudo -S sudo mongod"
end tell'
echo "Start mongodb"

#開啟sublime 並運行gulp
osascript -e 'tell app "Terminal"
    do script "cd /Develop/Folder/Path && sublime . && echo '"$password"'|sudo -S gulp "
end tell'
echo "Start sublime && develop"

#等待開發環境運行3秒
sleep 3

#開啟localhost
open http://127.0.0.1:3000 && exit