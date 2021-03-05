#!/bin/bash

ADDR=$(/sbin/ifconfig eth0 | grep 'inet ' | awk '{print $2}')
HOST=$(hostname)
echo "server 192.168.2.213" > /tmp/nsupdate.txt
echo "update delete $HOST" >> /tmp/nsupdate.txt
echo "update add $HOST 86400 A $ADDR" >> /tmp/nsupdate.txt
echo "update delete $HOST PTR" >> /tmp/nsupdate.txt
echo "update add $HOST 86400 PTR $ADDR" >> /tmp/nsupdate.txt
echo "send" >> /tmp/nsupdate.txt
nsupdate /tmp/nsupdate.txt
