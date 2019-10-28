#! /bin/bash

#######################################################################
#
# Author:		Hamza Saeed
# Date Created:		11/11/15
# Date Modified:	02/12/15
#
# Description:		Lists the first few lines of every file
#			in directory specified by user.
#
# Usage:		lshead.bash [Option] [NumberOfLines] [Directory]
# Example:		lshead.bash -head 4 ~/bin
#
# Exit codes:
#	0		Success
#	1		Incorrect number of arguments
#	2		Invalid option
#	3		Invalid directory
#	4		Non-integer value entered for Number of lines
#	5		Directory is empty
#	6		File entered instead of directory
########################################################################

#Ensures that at least 3 arguments are entered. If not, display error msg.
if [ $# -lt 3 ]; then
	echo "Error. Command needs more arguments!"
	echo "Usage: lshead.bash [Option] [NumberOfLines] [Directory]"
	exit 1
else
#Checks if argument 2 is a  positive number. If not, displays error msg.
	if [[ $2 =~ ^[[:digit:]]+$ ]];then

#Checks that the directory exists, if not displays error msg.
		if [ -d $3 ]; then
#Checks if directory is empty. If it is, display error msg.
			if [[ $(ls $3 | wc -l) = 0 ]]; then
				echo "This directory is empty."
				exit 5
			fi

#Checks that either -head  or -tail is entered. If it is, display head/tail of file
#If not, display error message
			if [ $1 == "-head" ]; then
				head -n $2 $3/*
			elif [ $1 == "-tail" ]; then
				tail -n $2 $3/*
			else
				echo "Error. Please enter either '-head' or '-tail'"
				exit 2
			fi
		elif [ -f $3 ]; then
#Checks if file entered is a regular file. If it is, display error message.
			echo "Error. You entered a regular file. Please enter a directory instead"
		else 
			echo "Error. This directory does not exist."
			exit 3
		fi
	else
		echo "Error. Number of lines must be a positive integer."
		exit 4
	fi

fi
exit

