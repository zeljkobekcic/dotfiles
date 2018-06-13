# !/usr/bin/env bash

# This function takes three arguments
# First argument: The path to the csv file with the exported data from Enpass
# Second argument: The name of the file in pass
# Third argument: The name of the service in the csv.
# 
# example call:
# bash enpass_to_pass.sh my_enpass_csv.csv gitlab.com gitlab 
# This creates in pass an file in www/gitlab.com

ENPASS_CSV="$1"
SERVICE="$2"
TO_BE_ADDED="${3}"

OLD_IFS=$IFS
IFS=","

content=`cat $ENPASS_CSV | grep "$TO_BE_ADDED"`
tags=($content)
username=''
password=''
name=${tags[0]}

for (( i=1; i<${#tags[@]}; i++ ))
do
    if [ ${tags[$i]} == "\"Username\"" ]
    then
        i=$i+1
        username=${tags[$i]}
    fi

    if [ ${tags[$i]} == "\"Password\"" ]
    then
        i=$i+1
        password=${tags[$i]}
    fi

done

(echo "${password:1:-1}"; echo "login: ${username:1:-1}")  | \
    pass insert --multiline "www/$SERVICE"
