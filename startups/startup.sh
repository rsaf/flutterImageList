#!/bin/bash

flutterBasePath="$(echo $(dirname $(pwd)))"
iosPath="${flutterBasePath}/.ios"
runnerPath="${flutterBasePath}/.ios/Runner"

echo "正在替换Info.plist"
plistPath="${flutterBasePath}/startups/Info.plist"
cp -rf ${plistPath} ${runnerPath}
echo "Info.plist 替换完成"

 echo "正在替换Appdelegate"
 delegatePath="${flutterBasePath}/startups/AppDelegate.m"
 cp -rf ${delegatePath} ${runnerPath}
 echo "Appdelegate.m 替换完成"

echo "正在替换Podfile"
podPath="${flutterBasePath}/startups/Podfile"
cp -rf ${podPath} ${iosPath}
echo "Podfile 替换完成"

echo "火箭初始化完成，🚀🚀🚀🚀，舰长来发射吧～"
