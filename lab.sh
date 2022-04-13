#!/bin/bash


if [ $# -lt 2 ]; then
	echo "Incorrect format of inputs"
	echo "Expected two files"
    echo "Correct Usage: lab.sh input_filename output_filename"
    exit 1
fi


if ls "$1" &> /dev/null
then
	echo "Part 3 of the question" >> $2
	echo "----------------------" >> $2
    awk -F, '{print $1" "$2" "$3" "$5" "$6" "$7" "$10" "$11}' $1 > $2

	echo "----------------------" >> $2
	echo "Part 4 of the question" >> $2
	echo "----------------------" >> $2
    awk -F, '{ if($3 == "Bachelor'\''s") print $1;}' $1 >> $2

	echo "----------------------" >> $2
	echo "Part 5 of the question" >> $2
	echo "----------------------" >> $2
    awk -F, 'NR>1 {a[$6]+=$7; c[$6]++} END{print "Geography: Average Admission Rate"; for(i in a) print i": " a[i]/c[i]}' $1 >> $2

	echo "----------------------" >> $2
	echo "Part 6 of the question" >> $2
	echo "----------------------" >> $2
    # we first remove the first row of the csv file because it would create issues in sorting the columns
	# Then we reverse sort the 16th column of the csv file
	# Push first 5 entries to a new file and print it
	sed '1d' $1 >> temporary1.csv
	sort -k16 -nr -t, temporary1.csv >>temporary2.csv
	head -5 temporary2.csv >>temporary3.csv
	awk -F "\"*,\"*" '{print $1}' temporary3.csv >>$2
	rm temporary1.csv
	rm temporary2.csv
	rm temporary3.csv

else 
    echo "The input file given is incorrect"
	echo "Please check for the correct filename or whether the file name exists or not"
fi 
