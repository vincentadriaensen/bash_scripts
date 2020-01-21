#!/bin/bash
number_of_arguments=$#
location=$1
input_file=$2
multi_search=false

show_help()
{
	echo
	echo -e "-- An error occured. --"
	echo
	echo -e "Please provide following parameters:"
	echo -e "\t-location"
	echo -e "\t-term(s) to look for:"
	echo -e "\t\t-This parameter should be a file name if you want to run a recursive search for multiple words."
	echo -e "\t\t-If you only want to search for one specific term. You can enter the term as a parameter. NOTE: make sure there is no file with that name!"
	echo
}

check_parameter_given(){
	if [ $number_of_arguments -lt 2 ] || [ $number_of_arguments -gt 2 ]
	then
		show_help
		exit 1
	fi
}

check_multi_search(){
	if [ -f $input_file ]
	then 
		echo "File found. Recursive find is active for its content."
		echo ""
		multi_search=true
	else
		echo "WARNING: File does not exist. We will search for the given parameter $input_file"
		echo ""
		multi_search=false
	fi
}

run_validation_checks(){
	check_parameter_given
	check_multi_search
}

search_term(){
	term=$1
	result=$(find $location -type f -print0 | xargs -0 grep -l "$term")

	if [ ! -z "$result" ]
	then
		echo -e "\"$term\" found in following files:"
		echo "$result"
	else
		echo -e "\tWARNING: \"$term\" NOT FOUND."
	fi

	echo ""
}

run () {
	run_validation_checks
	
	if $multi_search 
	then
		while IFS= read -r search_term
		do
			echo "--- Searching for $search_term ---"
			search_term $search_term
		done < "$input_file"
	else
		search_term $input_file
	fi
	
	echo ""
	echo "Done"
}

run

