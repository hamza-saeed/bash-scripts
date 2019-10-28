#! /bin/bash
#
####################################################
#
# Author:	Hamza Saeed
# Date Created:	11/11/2015
# Date Modified	25/11/2015
#
#
# Description:	Makes a specified file executable
#		to all users
# Usage:	chmx.bash [file]
# Example:	chmx.bash file1.bash
#
# Exit codes:
#	0	Success
#	1	Incorrect number of arguments
#	2	File not valid
###################################################

#Checks to ensure that the user entered argument. If not, outputs error msg
if [ $# -lt 1 ]; then
	echo "Error. Command needs more arguments!"
	echo "Useage: chmx.bash [file]"
	exit 1
elif [ $# -gt 1 ]; then
	echo "Error. Too many arguments!"
	echo "Usage: chmx.bash [file]"
	exit 1
else

#Check if file exists, and makes it executable if it does. If not, outputs error msg
	if [ -f $1 ]; then
		chmod +x $1
		echo "Successfully made file $1 executable."
	elif [ -d $1 ]; then
		chmod +x $1/*
		echo "Successfully made all files in directory $1 executable."
	else
		echo "Error. Please specify a valid file"
		exit 2
	fi
fi
exit
