#!/bin/bash

# Settings
CONFIG_REGION="eu-west-1"
CONFIG_PORT="22"

# Get IP Address
IP_ADDR="`curl http://checkip.amazonaws.com`"
IP_ADDR="$IP_ADDR/32"

cat /dev/null > /tmp/ec2.info

tmpFile="/tmp/ec2.info"

ec2Info=`ec2-describe-group --region eu-west-1 > $tmpFile`

sec_groups=`cat $tmpFile | grep GROUP | cut -f4`
numOfGroups=`cat $tmpFile | grep GROUP | wc -l`

echo "You are using IP Address:  $IP_ADDR"
echo ""
echo "Groups Found: $numOfGroups"

for security_group in $sec_groups
do

     echo ""
     echo $security_group
     echo ""

     arg_string="--region $CONFIG_REGION $security_group  -p $CONFIG_PORT -s $IP_ADDR"

     ec2-authorize $arg_string

done
