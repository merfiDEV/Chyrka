#!/bin/bash
# Этот скрипт выводит сообщение об успешном запуске
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
python /storage/emulated/0/Logs/отходняк.py
exit 0
