sudo apt install adb
adb devices
which adb
sudo /usr/bin/adb kill-server
sudo /usr/bin/adb devices

adb shell pm list package
adb shell pm list package|grep canary
adb shell dumpsys | grep com.chrome.canary
adb pull /data/app/com.chrome.canary-1/base.apk ~/Documents/canary.apk

Another device:
adb devices
adb install -f ~/Documents/canary.apk
