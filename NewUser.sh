#!/bin/bash
#Simple script to add a new user

#set -x

echo "Enter Username: "
	read username
echo "Enter Comment: "
	read comment
echo "Do you want to create new user $username with $comment as a comment?. y/n? "
	read choice
if  [ "$choice" = "y" ];
	then
		useradd -m -c "$comment" $username
echo "Setting up new password for $username"
		passwd $username

fi
