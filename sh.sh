clear
echo "[DEBUG]"
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
