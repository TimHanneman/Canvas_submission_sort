# Canvas_submission_sort
Quickly sort student assignment submissions from Canvas into student folders with original filenames.

# Summary
Canvas is an online learning platform used by many schools in conjunction with their classes. The platform has an assignment submission system and one of the options is to "Download Submissions" and in return you recieve a zip file with all the files students have submitted. The problem is that canvas changes all the filenames so that they contain a student name, two id fields. The naming convention also includes an extra field if the assignment was submitted late and if the assignment was resubmitted multiple times a number is added at the end of the filename, but before the file extenstion if there is one. Having the original filenames is very useful if they are submitting code that needs to be compiled.

#Purpose
This script sorts each assignment into a folder with a student_name and renames the files back to the original.

#Use
Step 1) Extract all the files from the zip folder you recieved from canvas into a folder
Step 2) Copy "sub_name.awk" and "submission_sort.sh" into the folder with the canvas assignments
Step 3) From a Bash Shell type in "./submission_sort.sh"
Step 4) Have fun grading!


# Issues
