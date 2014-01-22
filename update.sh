#!/bin/bash

NORMAL=$(tput sgr0)
GREEN=$(tput setaf 2; tput bold)
YELLOW=$(tput setaf 3)
RED=$(tput setaf 1)

function red() {
    echo -e "$RED$*$NORMAL"
}

function green() {
    echo -e "$GREEN$*$NORMAL"
}

function yellow() {
    echo -e "$YELLOW$*$NORMAL"
}

echo ""
yellow "*******************************************************"
echo   "***   AWS Ec2 Security Group - Dynamic IP Updater   ***"
yellow "*******************************************************"
echo ""

# Settings
CONFIG_REGION="eu-west-1"
CONFIG_PORT="22"

echo "Fetching your IP Address from http://checkip.amazonaws.com"

# Get IP Address
IP_ADDR="`curl -s http://checkip.amazonaws.com`"
IP_ADDR="$IP_ADDR/32"

# Empty the file
cat /dev/null > /tmp/ec2.info

tmpFile="/tmp/ec2.info"

ec2Info=`ec2-describe-group --region eu-west-1 > $tmpFile`

sec_groups=`cat $tmpFile | grep GROUP | cut -f4`
numOfGroups=`cat $tmpFile | grep GROUP | wc -l`

echo ""
echo "Your IP address is: $IP_ADDR"
echo ""
echo "$numOfGroups security groups will be updated" | sed 's/^ *//g'

for security_group in $sec_groups
do

     echo ""
     echo "Attempting to change Security Group: `tput setaf 2`$security_group`tput setaf 7`"
     echo ""

     arg_string="--region $CONFIG_REGION $security_group  -p $CONFIG_PORT -s $IP_ADDR"

     ec2-authorize $arg_string

done
