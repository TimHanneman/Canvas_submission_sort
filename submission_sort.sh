#!/bin/bash
#Author Timothy Hanneman
#Date 4/12/2022
#Copyright GPL2
#Abstract: Used on student files downloaded from CANVAS. Sorts the files into folders with student names, renames files back to original names.

#HowToRun: Copy the scripts submission_sort.sh & sub_name.awk into folder with all the student assignments. Type in at a bash prompt "./submission_sort.sh" 

#Comments:
#If The script is ever extended these variables might be useful
#Source folder, Output directory, name of awk script, unique character for folder, if 1 replace spaces with underscores

dire="./"
o_dir="./"
awk_script="sub_name.awk"
no=0
replace_space=0

#Function used to create folder name with id
folder_name(){
	#Abbreviate Name For folder & add charcter to ensure reasonable level of unqiueness
	#L is for LATE case of file name.
	if [ $2 == L ]
	then
		z=$(echo $1 | cut -f1 -d_)
		zz=$(echo $1 | cut -f3 -d_)
		a=$z$zz
	else
		z=$(echo $1 | cut -f1-2 -d_)
		a=$z
	fi
	
	echo $a
	return 0 
}

for f in "$dire"*
do
	
	#ff=$(basename $f) #Change f into ff in code for quick fix when running script with parameters
	
	#Optional Replace any spaces with underscores
	if [ $replace_space -eq 1 ]
	then
		echo "replace space"
		f2=${f// /_}
	else
		f2=$f
	fi


	#Remove first three fields from filename or 4 fields if LATE
	late=$(echo $f2 | cut -f2 -d_)
	if [ "$late" == "LATE" ]
	then
		a=$(folder_name "$f" "L") 
		b=$(echo $f2 | cut -f5- -d_)
	else
		a=$(folder_name "$f" 0) 
		b=$(echo $f2 |cut -f4- -d_)
	fi

	#Remove added numbers from filenames
	c=$(echo $b | awk -f sub_name.awk)

	#Rename the files
	if [ "$f" != "./$awk_script" ] && [ "$f" != "$0" ]
	then
		mv "$f"  "$dire""$c"
	fi

	#Moving the renamed files if they were renamed (if not moved then there is an error)
	if [ -f "$dire""$c" ] 
	then
		mkdir -p "$o_dir""$a""$no"
		mv "$dire""$c" "$o_dir""$a""$no"/"$c"
	else
		echo " $f was skipped. \n"
	fi

done
