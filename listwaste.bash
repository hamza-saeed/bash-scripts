#! /bin/bash
#
########################################################
#Author:	Hamza Saeed
#Date Created:	16/11/2015
#Date Modified:	16/11/2015
#
#Description:	liststhe name of all files in the waste
#		 bin and their size in bytes
#
#Usage:
#listwaste.bash
#
#Error Codes:
#	0	Success
#	1	The waste directory is empty
########################################################

#Checks if waste directory empty, if it it display error msg
if [[ $(ls ~/waste | wc -l) = 0 ]]; then
        echo "The waste folder is empty."
	exit 1
else
#If not empty display files in and their size along with header
	echo "--------------------------------------------"
	echo "The files in the waste bin are"
	echo -n "Bytes  Filename"
	ls -l ~/waste|tr -s ' ' |cut -d' ' -f9,5
	echo "--------------------------------------------"
fi
exit
