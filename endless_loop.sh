i=1
#while [ $i -ne 100 ]; do
while [ $i -ne $$ ]; do
echo "$i: $$"
let "i=i+1"
#echo $i
done
