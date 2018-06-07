#!/bin/bash
#set -x
#system_date=$(date +%b-%d-%Y)
system_date=`date|awk '{print $2"-"$3"-"$6}'`
ping -c2 $1 > /dev/null 2>&1
if [ $? -ne 0 ]; then
   echo "$1      SERVER NOT REACHABLE"
else
   patch_date=`ssh rbal10@$1 "rpm -qa --last|head -1;exit"`
   patch_date=`echo $patch_date|awk '{print $3"-"$4"-"$6}'`
   if [[ "$patch_date" ==  "$system_date" ]]; then
      echo "$1     PATCH SUCCESSFUL"
   else
      echo "$1     PATCH FAILED/NO UPDATES"
fi
fi

