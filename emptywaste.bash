#!/bin/bash

##########################################################
#
# Author:		Hamza Saeed
# Date Created:		11/11/2015
# Date Modified:	29/11/2015
#
# Description:		Deletes everything permanantly
#			from waste directory
#
# Usage:		emptywaste.bash
#
# Exit codes:
#	0		Success
#	1		Waste directory already empty
##########################################################

#Checks if directory is empty, if it is, display error message
if [[ $(ls ~/waste | wc -l) = 0 ]]; then
	echo "The waste folder is already empty."
	exit 1
else
#Deletes contents of waste directory, and displays success msg
	rm ~/waste/*

	echo "The contents of the waste folder has successfully been deleted"


fi

exit 0
