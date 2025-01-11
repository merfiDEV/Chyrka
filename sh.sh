clear
echo "[DEBUG]"
if [ -f /sys/class/thermal/thermal_zone0/temp ]; then
    CPU_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
    CPU_TEMP_C=$(echo "scale=1; $CPU_TEMP / 1000" | bc)
    echo "[CPU TEMP=$CPU_TEMP_C°C]"
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
