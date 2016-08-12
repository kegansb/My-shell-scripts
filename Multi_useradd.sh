#!/bin/bash
## Intent: Add multiple users from a list
## Created: 29-Jul-2016
## Written by: ksb1342 [Kegan Brauning]
## Ver. 0.0.1

  set -x
file=$1
#echo $file
#File should have 	Field 1 as username [ [-U] for group with the same name as the user
#					Field 2 as uid [-u]
#					Field 3 as comment [-c]

for i in `cat $file | cut -d"," -f1`
do
		password=`grep $i $file | cut -d"," -f3`
		echo $i $password
		grep_output=`grep $i /etc/passwd`
		if [ -z $grep_output  ]; then

				useradd -c $i
				echo $password | passwd $i --stdin;
				mkdir /home/exercises/$i
				chown $i /home/exercises/$i
				chmod 0700 /home/exercises/$i
		fi
done

