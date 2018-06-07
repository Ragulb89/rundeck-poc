#!/bin/bash
system_date=`date +%b-%d-%Y`
ping -c2 $1
if [ $? -ne 0 ]; then
   echo "$1      SERVER NOT REACHABLE"
else
   patch_date=`ssh -ttn $1 "rpm -qa --last|head -1|awk '{print $3"-"$4"-"$6}'"`
   if [ $patch_date -eq system_date ]; then
      echo "$1     PATCH SUCCESSFUL"
fi

