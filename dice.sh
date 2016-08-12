#!/bin/bash
## Intent: Dice Rolling Game
## Created: 30-Jun-2016
## Written: ksb1342 [Kegan Brauning]
## Version: 0.1.3

#clear
# set -x

rand_num1=0
rand_num2=0
let "rand_num1 = $RANDOM % 6 + 1"
let "rand_num2 = $RANDOM % 6 + 1"
let "total = $rand_num1 +  $rand_num2"
echo "You rolled |$rand_num1|  |$rand_num2| = $total1"

if ("$total1 = 7 || $total1 = 11"); 
		echo ("You rolled $total1, WINNER!! \n");

elif ($total1 = 2 || $total1 = 3 || $total1 = 12); then
		echo ("You have rolled $total1, LOSER!! \n");
fi
#else ($total1 = 4 || $total1 = 5 || $total1 = 6 || $total1 = 8 || $total1 = 9 || $total1 = 10); then
#		echo ("You have rolled $total1. You have made a point. Rerolling...\n"); do
#	while (1) {
#	let "rand_num1 = $RANDOM % 6 + 1"
#	let "rand_num2 = $RANDOM % 6 + 1"
#	let "total = $rand_num1 +  $rand_num2"
#	echo "You rolled |$rand_num1|  |$rand_num2| = $total2"
#done
