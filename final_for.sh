#!/bin/bash
## Intent: create shopping list using 'for' that exports to text file and appends with new input
## Created on: 22-Jun-2016
## Created by: ksb1342 'Kegan Brauning'
## Ver 1.2

clear

#set -x

echo "Your list currently has the following items:
"

cat shopping_list.txt

echo -n "
	Please enter items for a shopping list.
	Separate items with a space.
		"
read sli
	for temp_var in $sli; do #echo -ne "temp_var";
#	$sli
	echo $temp_var >> shopping_list.txt

done

cat shopping_list.txt
