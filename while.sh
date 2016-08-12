## While loop script requiring user input
## Created: 21-Jun-2016
## Written by: ksb1342 [Kegan Brauning]
## Ver. 0.1

echo -n "Enter a positive integer "
read eapi
i=0
while [ $eapi -ge $i ]
 do
  echo "$i"
  ((i++))
done
