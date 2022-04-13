#!/bin/awk
#Each line after BEGIN covers a single pattern in CANVAS filenames
# pattern1 -number found at end of filename
# pattern2 -number found before file extention
# Anything that doesn't match pattern 1 or 2
BEGIN{fix=0}
/.+-[0-9]+$/{fix=1;split($0,a,"-"); print a[1]}
/.+-[0-9]+\.[a-z,A-Z]+$/{fix=1;split($0,a,"-");split($0,b,".");printf("%s.%s\n", a[1],b[2])}
{if(fix==0){print $0};fix =0}
