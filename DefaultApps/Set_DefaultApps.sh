#!/bin/bash

### Version Beta 0.01
### Set Default Apps

### SETTINGS ########################################################################################


#AppDefaults="com.microsoft.teams tel; com.microsoft.outlook mailto;com.microsoft.outlook com.apple.ical.ics all"
AppDefaults=$4
#Current User
UserName=$(ls -la /dev/console | cut -d " " -f 4)
#LogFile
LogFolder="$HOME/logs"
LogFile="$LogFolder/DefaultApps.log"

#Create Logfolder


if [ ! -d "$HOME/logs/" ]; then
    mkdir -p "$HOME/logs/"
fi;

#Log Function
logger() {
    echo $(date "+%Y-%m-%d %H:%M:%S ") $1 >>"${LogFile}"
    echo $(date "+%Y-%m-%d %H:%M:%S ") $1
    
}

logger "-------------------------"
logger "Start Set Default App"

#Save the Status from IFS
OIFS="$IFS"

#Split String with Delimiter ;
IFS=';' read -ra Apps <<< "$AppDefaults"

#Set Default App with Duti
for App in "${Apps[@]}"
    do
    logger "Set the follwoing Defaults $App"
    Command="sudo -u $UserName /usr/local/bin/duti -sv $App"
    eval $Command
    done

# Restore IFS
IFS="$OIFS"


logger "End Set Default App"
logger "-------------------------"