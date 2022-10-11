#!/bin/bash

var1=$(pgrep -x "CarlaUE4-Linux-")
var2=$(pgrep -x "CarlaUE4.sh")
var3=$(pgrep -x "python3")
var4=$(pgrep -x "roslaunch")
var5=$(pgrep -x "rosnode")
var6=$(pgrep -x "rostopic")
var7=$(pgrep -x "sh")

var="$var1 $var2 $var3 $var4 $var5 $var6 $var7"

for i in $var;
do
    echo $i
    kill -9 ${i}; 
done

echo 'y' | rosnode cleanup
rosnode list | xargs rosnode kill

pkill rosmaster