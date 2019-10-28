#! /bin/bash

###############################################################################
#
#Author:	Hamza Saeed
#Date Created:	25/11/2015
#Date Modified:	29/11/2015
#
#Description:	Outputs day of the week corresponding to the number entered.
#		The script runs in a loop until control value is input (-1)
#Usage: 	digitalDay.bash
#Example:	digitalDay.bash
#		digitalDay.bash -help
#
#Exit Codes:
#	0	Success
#	1	Help statement
################################################################################

#initialise inputs
validInput=0
invalidInput=0

#if argument is -help, display help statement
if [ "$1" = "-help" ]; then
echo "Usage:	digitalDay.bash	[Once you run the script, you will be prompted to enter a value]"
echo "	The script runs in a loop until the control value is input (-1)"
exit 1
fi

#while input is not -1
while [ "$input" != -1 ]
do
	#read input
	read -p "Enter number: " input
	#if empty, display error msg
	if [[ -z $input ]]; then
		echo "Error. Input not detected!"
		#incrememnt invalidInput
		(( invalidInput += 1 ))
	else
		#if positive number
		if [[ $input =~ ^[[:digit:]]+$ ]]; then
			#if input mod 7 = 0, display sunday
			if (( $input % 7 == 0 )); then
				echo "Sunday"
				#increment validInput
				(( validInput += 1 ))
			#if input mod 7 = 1, display monday
			elif (( $input % 7 == 1)); then
				echo "Monday"
				#increment validInput
				(( validInput += 1 ))
			#if input mod 7 = 2, display tuesday
			elif (( $input % 7 == 2)); then
				echo "Tuesday"
				#increment validInput
				(( validInput += 1 ))
			#if input mod 7 = 3, display wednesday
			elif (( $input % 7 == 3)); then
				echo "Wednesday"
				#increment validInput
				(( validInput += 1 ))
			#if input mod 7 = 4, display thursday
			elif (( $input % 7 == 4)); then
				echo "Thursday"
				#increment validInput
				(( validInput += 1 ))
			#if input mod 7 = 5, display friday
			elif (( $input % 7 == 5)); then
				echo "Friday"
				#increment validInput
				(( validInput += 1 ))
			#if input mod 7 = 6, display saturday
			elif (( $input % 7 == 6)); then
				echo "Saturday"
				#increment validInput
				(( validInput += 1 ))
			else
				#display error msg
				echo "Unexpected error. Please try again"
				#increment invalidInput
				(( invalidInput += 1 ))
			fi
		#if input is -1
		elif [ $input == "-1" ];then
			#do nothing
			(( invalidInput += 0 ))
		else
			#display error msg
			echo "Argument must be a positive integer."
			#increment invalidInput
			((invalidInput += 1))
		fi
	fi
done
#display number of valid inputs
echo "The number of valid inputs was $validInput"
#display number of invalid inputs
echo "The number of invalid inputs was $invalidInput"
