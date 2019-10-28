#!/bin/bash

################################################
#
#Author:	Hamza Saeed
#Date Created:	11/12/15
#Date Modified:	11/12/15
#
#Description:	Converts decimal number to hex/octal/binary 
#		depending on option
#
#Usage:		convert.bash [Option] [NumberToConvert]
#Example:	convert.bash hex 15
#Exit Codes:
#    0		Success
#    1		Incorrect Number of Arguments
#    2		Invalid Option
#    3		Invalid number
#    4		Help Statement
################################################
base=10

if [ "$1" = "-help" ]; then
	echo ""
	echo "convert.bash [Option] [Number to convert]"
	echo "Options-"
	echo "		binary [converts the decimal number to binary]"
	echo "		hex [converts the decimal number to hexadecimal]"
	echo "		octal [converts the decimal number to octal]"
	echo ""
	echo "Number to convert- Must be positive decimal number"
	echo ""
	exit 4
fi
if [ $# -lt 2 ]; then
	echo "Incorrect number of arguments"
	echo "Usage: convert.bash [Option] [Decimal Number]"
	exit 1

else
	if [[ $2 =~ ^[[:digit:]]+$ ]];then

		if [ "$1" == "hex" ]; then
			(( base = 16 ))
		elif [ "$1" == "binary" ]; then
			(( base = 2 ))
		elif [ "$1" == "octal" ]; then
			(( base = 8 ))
		else
			echo "Error. Incorrect Option"
			echo "For help, please type 'convert.bash -help'"
			exit 2
		fi
		echo "-------------------------------------"
		echo -n "The $1 representation for $2 is "
		echo "obase=$base; $2" | bc
		echo "-------------------------------------"
		exit 0
	else
		echo "Error. Number to convert must be a positive integer."
		echo "For help please type 'convert.bash -help'"
		exit 3
	fi


fi
