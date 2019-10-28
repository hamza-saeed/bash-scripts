#!/bin/bash

#################################################################
#
# Author:		Hamza Saeed
# Date Created:		11/11/15
# Date Modified:	16/11/15
#
# Description:		Copies the specified file to the waste
#			directory and makes it a .waste file
#
# Usage:		del.bash [file]
# Example:		del.bash file1.txt
#
# Exit codes:
#
#	0		Success
#	1		Incorrect number of arguments
#	2		Invalid file
################################################################

#Checks to ensure that the user entered argument. If not, outputs error msg 
if [ $# -lt 1 ]; then
	echo "Error. Command needs more arguments!"
	echo "Usage: del.bash [file]"
	exit 1
else
#Checks that directory exists, if not creates directory.
	if [ ! -d ~/waste ]; then
        	mkdir ~/waste
        	echo "Created waste directory"
		fi

#Checks that file exits,  and makes copy with .waste fileextension and copies to waste dir
#If not, displays error message
 
	if [ -f $1 ]; then
		cp $1 $1.waste
		cp $1.waste ~/waste
		rm $1.waste
		echo "Successfully copied file $1 to waste directory"
	elif [ -d $1 ]; then
		echo "Error. You entered a directory. Please enter a regular file"
	else
		echo "Error. Please specify a valid file"
		exit 2
	fi
fi
exit
