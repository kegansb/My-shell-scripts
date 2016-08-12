# This is a sample 'for' statement

for user in `grep "[a-z][a-z][a-z][a-z][a-z][a-z][a-z]:" /etc/passwd|cut -d\: -f1`; do last $user| head -1;
done

