#!/bin/sh

# Oskar Agustsson Copyright 2015
# Grab screenshots from OSX, iOS, Android at the same time.
# To verify watermarking in ad breaks.

time=$(date +%Y-%m-%d-%H-%M-%S)

echo $time
# Capture

#Android
adb shell screencap -p /sdcard/screencap.png &


#iOS
idevicescreenshot screenshot.tiff &

#OS X
screencapture test1.jpg test2.jpg &

sleep 6
# Pull the file
adb pull /sdcard/screencap.png

mv screencap.png android-$time.png

# Rotate the photo
sips -r 270 android-$time.png


rm test1.jpg
mv test2.jpg osx-$time.jpg

mv screenshot.tiff ios-$time.tiff

sips -s format jpeg ios-$time.tiff 

mv ios-$time.tiff ios-$time.jpg

