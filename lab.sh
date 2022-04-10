#!/bin/bash
# Author : Mohd Umam
# Objective : To read CSV file and print it
#----------------------------------------------------

INPUT = college.csv
OLDIFS = $IFS
IFS = ','

[ ! -f $INPUT]  && { echo "$INPUT file not found "; exit 99 ;}

while read flname dob ssn tel status

do

