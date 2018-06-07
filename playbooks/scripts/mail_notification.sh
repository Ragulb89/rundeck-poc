#!/bin/sh
#set -x
patch_date=`cat /etc/acs.patch |tail -1|awk '{print $2"-"$3"-"$6}'`
system_date=`date +%b-%d-%Y`
server_name=`hostname`
if [ "$patch_date" ==  "$system_date" ]; then
   
     echo $server_name   PATCH SUCCESSFUL
else

    echo $server_name   PATCH UNSUCCESSFUL
fi


    
