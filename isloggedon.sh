#!/bin/bash
## Intent: Show who the current user is or when last time a user loggen on to system
## Created: 29-Jun-2016
## Written by: ksb1342 [Kegan Brauning]
## Ver. 0.1.1

#	set -x

user=$1
echo $user
exists=`grep $user /etc/passwd | cut -d: -f1 | grep ^\$user$`
#echo "exists: $exists"

	if [ -z "$exists" ]; then
		echo "$user does not exist"
	else
		echo "$user does exist"
	loggedon=`who | cut -d" " -f1 | grep ^\$user$`
		if [ -n "$loggedon" ]; then
			echo "$user is currently logged on."
		else
	lastloggedon=`lastlog -u $user | tail -1 | awk'{ print "$4" "$5" "$6" "$7" "$8" "$9" }'`
		echo "$user last logged on $lastloggedon"
		fi
	fi

