#!/bin/bash
#AUTHOR: Ertugrul Yakin, https://ertugrulyakin.engineer

OPT=$1
freq=$2

rhb () {
 while true
 do
  xset -led named "Scroll Lock"
  sleep 0.15s
  xset led named "Scroll Lock"
  sleep 0.1s
  xset -led named "Scroll Lock"
  sleep 0.15s
  xset led named "Scroll Lock"
  sleep 1.5s
 done
}

hb () {
 while true
 do
  xset led named "Scroll Lock"
  sleep 0.2s
  xset -led named "Scroll Lock"
  sleep 0.1s
  xset led named "Scroll Lock"
  sleep 0.2s
  xset -led named "Scroll Lock"
  sleep 1.5s
 done
}

flash () {
 frequency=`echo "scale=1; 1/10" | bc -l`
 if [[ $# -eq 1 ]];
  then
   frequency=`echo "scale=1; $1/20" | bc -l`
fi
 while true
  do
   xset -led named "Scroll Lock"
   sleep $frequency
   xset led named "Scroll Lock"
   sleep $frequency
 done
}

notice () {
  while true
  do
   xset -led named "Scroll Lock"
   sleep 2s
   for ((i=0; i<20; i++))
   do
    xset led named "Scroll Lock" 
    sleep .05s
    xset -led named "Scroll Lock" 
    sleep .05s
   done
  done
}


sine () {
  while true
  do
   for ((i=41; i>1; i--))
   do
    sTime=`echo "scale=5; $i/200" | bc -l`
    xset led named "Scroll Lock" 
    sleep $sTime
    xset -led named "Scroll Lock" 
    sleep $sTime
   done
   for ((i=1; i<41; i++))
   do
    sTime=`echo "scale=5; $i/200" | bc -l`
    xset led named "Scroll Lock" 
    sleep $sTime
    xset -led named "Scroll Lock" 
    sleep $sTime
   done
  done
}

showHelp () {
 echo -e "\n\033[38;5;75mUsage:\033[39m"
 echo -e " * on\n * off\n * heartbeat || hb\n * reverseheartbeat || rhb\n * flash {speed, lowest is fastest}\n * notice || ntc\n * sine || sn"
 echo -e "\033[38;5;75mEx:\033[39m"
 echo " -> kbled on"
 echo " -> kbled flash"
 echo " -> kbled flash 5"
 echo " -> kbled hb"
 echo " -> kbled ntc"
}

if [[ "$OPT" == "heartbeat" ]] || [[ "$OPT" == "hb" ]]; then
 hb
elif [[ "$OPT" == "sine" ]] || [[ "$OPT" == "sn" ]]; then
 sine
elif [[ "$OPT" == "reverseheartbeat" ]] || [[ "$OPT" == "rhb" ]]; then
 rhb
elif [[ "$OPT" == "flash" ]]; then
 flash $2
elif [[ "$OPT" == "notice" ]] || [[ "$OPT" == "ntc" ]]; then
 notice
elif [[ "$OPT" == "on" ]]; then
 xset led named "Scroll Lock"
elif [[ "$OPT" == "off" ]] || [[ "$OPT" == "kill" ]]; then
 xset -led named "Scroll Lock"
 pkill -f "kbled"
elif [[ "$OPT" == "help" ]]; then
 showHelp
else
 showHelp
fi