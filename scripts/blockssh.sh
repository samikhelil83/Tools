#!/bin/bash


#set -x

# path to iptables
IPTABLES="/sbin/iptables";

# list of known ssh List
URL="https://lists.blocklist.de/lists/ssh.txt";

# save local copy here
FILE="/tmp/ssh.tmp";

# iptables custom chain
CHAIN="SSH_Block";

# check to see if the chain already exists                                                                                                                                                                         
$IPTABLES -L $CHAIN -n                                                                                                                                                                                             
                                                                                                                                                                                                                   
# check to see if the chain already exists                                                                                                                                                                         
if [ $? -eq 0 ]; then                                                                                                                                                                                              
                                                                                                                                                                                                                   
    # flush the old rules                                                                                                                                                                                          
    $IPTABLES -F $CHAIN                                                                                                                                                                                            
                                                                                                                                                                                                                   
    echo "Flushed old rules. Applying updated ALL list...."                                                                                                                                                        
                                                                                                                                                                                                                   
else                                                                                                                                                                                                               
                                                                                                                                                                                                                   
    # create a new chain set                                                                                                                                                                                       
    $IPTABLES -N $CHAIN

    # tie chain to input rules so it runs
    $IPTABLES -A INPUT -j $CHAIN

    # don't allow this traffic through
    $IPTABLES -A FORWARD -j $CHAIN

    echo "Chain not detected. Creating new chain and adding All list...."

fi;

# get a copy of the All list
wget -qc --no-check-certificate $URL -O $FILE &&\
sort -u $FILE > $FILE.sorted &&\
mv $FILE.sorted $FILE

# iterate through all known All hosts
for IP in $( cat $FILE | grep -v ":"  ); do

    # add the ip address log rule to the chain
    $IPTABLES -A $CHAIN -p 0 -s $IP -j LOG --log-prefix "[SSH BLOCK]" -m limit --limit 4/sec --limit-burst 10

    # add the ip address to the chain
    $IPTABLES -A $CHAIN -p 0 -s $IP -j DROP

    echo $IP

done

echo "Done!"

# remove the ssh list
unlink $FILE

