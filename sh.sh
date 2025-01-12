#!/bin/bash

# Скачиваем файл Автообнова.py
FILE_NAME="Автообнова.py"
DOWNLOAD_URL="https://raw.githubusercontent.com/merfiDEV/Z/main/$FILE_NAME"
SAVE_PATH="/storage/emulated/0/$FILE_NAME"

echo "Скачиваем файл $FILE_NAME..."

if curl -o "$SAVE_PATH" -L "$DOWNLOAD_URL"; then
    echo "Файл авто обновы установлен в $SAVE_PATH"
    echo "Auto-update file installed at $SAVE_PATH"
else
    echo "Ошибка скачивания файла $FILE_NAME!"
    exit 1
fi

clear
echo "[DEBUG]"

if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
    CPU_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
    CPU_TEMP_C=$(echo "scale=1; $CPU_TEMP / 1000" | bc)
    echo "[CPU TEMP=$CPU_TEMP_C°C]"
    if [ "$(echo "$CPU_TEMP_C == 37.0" | bc)" -eq 1 ]; then
        echo "[CPU NOT RESPONSE]"
    fi
else
    echo "[CPU TEMP=Not Available]"
fi

PING_RESULT=$(ping -c 1 8.8.8.8 | grep 'time=' | awk -F'time=' '{print $2}' | awk '{print $1}')
if [ -n "$PING_RESULT" ]; then
    echo "[PING=$PING_RESULT ms]"
else
    echo "[PING=Not Available]"
fi

ANDROID_VERSION=$(getprop ro.build.version.release)
if [ -n "$ANDROID_VERSION" ]; then
    echo "[ANDROID=$ANDROID_VERSION]"
else
    echo "[ANDROID=Unknown]"
fi

if [ "$(id -u)" -eq 0 ]; then
    echo "Root access detected! ✅"
else
    echo "No root access! ❌"
fi

echo "[Init Python..]"
sleep 2
python3 --version
echo "[Python Successfully initialized]"
echo "[Checking Bash]"
sleep 2
bash --version | head -n 1
echo "[Bash Checked]"
sleep 1
echo "[Successful Launch]"
exit 0
