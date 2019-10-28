#!/bin/bash

###################################################
#Author:	Hamza Saeed
#Date Created:	30/11/2015
#Date Modified:	12/12/2015
#
#
#Descrition:	Sends a series of pings to the website inputted by user
#		and informs user of website status. The script runs in a 
#		loop until the control value is entered (-1) 
#Usage:		websiteStatus.bash 
#		websiteStatus.bash -help
#
#Exit Codes:
#	0	Website is up
#	1	Help statement
####################################################
onlineWebsites=0
offlineWebsites=0

if [ "$1" = "-help" ]; then
	echo "Usage:    websiteStatus.bash [Once you run the script, you will be prompted to enter a website URL]"
	echo "                              The script runs in a loop until the control value is input (-1)"
	exit 1
fi

while [ "$input" != -1 ]
do
        read -p "Enter URL: " input

        if [[ -z $input ]]; then
                echo "Error. Input not detected!"

	elif [ $input == "-1" ];then
		(( offlineWebsites +=0 ))
	else
		echo "Please wait . . ."
		ping -c 3 -i 1 $input

		if [[ $? = 0 ]]; then
			(( onlineWebsites += 1 ))
			echo "----------------"
			echo "Website is up!"
			echo "----------------"
		else
			(( offlineWebsites += 1 ))
			echo "------------------------------------"
			echo "Website is currently offline!"
			echo "------------------------------------"
		fi
	fi
done
echo "The number of online websites was $onlineWebsites"
echo "The number of offline websites was $offlineWebsites"
