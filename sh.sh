#!/bin/bash
# Этот скрипт выводит сообщение об успешном запуске
echo "[Init Python..]"
python3 --version
echo "[Python Successfully initialized]"
echo "[Checking Bash]"
bash --version | head -n 1
echo "[Bash Checked]"
echo "[Successful Launch]"
exit 0
