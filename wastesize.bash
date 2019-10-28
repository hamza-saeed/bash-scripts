#! /bin/bash

###################################################
#
#Author:	Hamza Saeed
#Date Created:	11/11/15
#Date Modified:	02/12/15
#
#Description:	Reports number of files in
#		the waste bin
#
# Usage:	wastesize.bash
#
# Exit codes:
#	0	Success
####################################################

#Checks if waste bin has any files in. If not, tells user.
if [[ $(ls ~/waste | wc -l) = 0 ]]; then
        echo "The waste folder is empty."
        exit 0
fi

#Displays number of items in waste bin
echo "The number of files that the waste bin contains is $(ls ~/waste | wc -l)"
exit
