# get a list of users
# cut -d: -f1 to get list of users
for user in `cut -d: -f1 /etc/passwd`
#for user in ' 1 2 3'
	    do
# for each user find the last login time
# last "username" | head -1
		last_line=`last $user | head -1`
#echo $last_line     
		if [ -z "$last_line" ]; then
		    echo "$user did not ever login"
		else
		    echo $last_line
	        fi
# print the last login time
# echo from a variable
done
