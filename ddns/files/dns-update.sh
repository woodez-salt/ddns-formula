#!/bin/bash

INTF=$(ip link show | awk '/^[1-9]/{print $2}' | cut -d: -f1 | grep -v lo)
ADDR=$(/sbin/ifconfig ${INF} | grep 'inet ' | awk '{print $2}' | grep -v 127.0.0.1)
HOST=$(hostname | cut -d\. -f1)

echo "server 192.168.2.213" > /tmp/nsupdate.txt
echo "update delete ${HOST}.woodez.net" >> /tmp/nsupdate.txt
echo "update add ${HOST}.woodez.net 86400 A $ADDR" >> /tmp/nsupdate.txt
echo "update delete ${HOST}.woodez.net PTR" >> /tmp/nsupdate.txt
echo "update add ${HOST}.woodez.net 86400 PTR $ADDR" >> /tmp/nsupdate.txt
echo "send" >> /tmp/nsupdate.txt

nsupdate /tmp/nsupdate.txt
