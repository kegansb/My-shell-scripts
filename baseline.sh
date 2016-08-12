 #!/bin/bash
 #Baseline script for running anytime system changes are made on my CentOS Server
 DATE=`date +%d-%h-%y:%H%M`
 FILENAME=/tmp/ksb1342-baseline_$DATE
 echo "============> Creating $FILENAME ===> cat for updated system baseline.     "
 netstat -tuln >$FILENAME
 lsof -i | grep TCP | grep LISTEN >> $FILENAME 
 lsof -i | grep UDP >> $FILENAME 
 ps -ef | awk '{ print $1" "$8" "$9}' >> $FILENAME
 cat /etc/passwd >> $FILENAME
 cat /etc/ssh/sshd_config | grep -v "^#" | grep -v "^$" >> $FILENAME
 cat /etc/sysconfig/iptables >> $FILENAME 
 iptables -L -n >> $FILENAME
