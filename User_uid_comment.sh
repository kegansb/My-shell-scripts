#!/bin/bash
## Intent: Add multiple users from a list
## Created: 29-Jul-2016
## Written by: ksb1342 [Kegan Brauning]
## Ver. 0.0.1

# set -x

#File should have
#		Field 1 as username [ [-U] for group with the same name as the user
#		Field 2 as uid [-u]
#		Field 3 as comment [-c]
#		[-G] add secondary groups seperated by comma, no white space

file=$1

#echo $file

for user in `cat $file | cut -d"," -f1`
do
		uid=`grep $user $file | cut -d"," -f2`
		echo $user $uid
		comment=`grep $user $file | cut -d"," -f3`
		echo $user $comment
		grep_output=`grep $user /etc/passwd`
		if [ -z $grep_output  ]; then

				useradd -m -c "$comment" -u "$uid" -G Wheel "$user"
#				useradd -m -N -c "$comment" -u "$uid" -G system_users "$user"
						chage -d 0 "$user"
		fi
done

