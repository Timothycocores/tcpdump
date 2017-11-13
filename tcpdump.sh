#!/bin/bash
#start a process in the background (it happens to be a TCP HTTP sniffer on the loopback interface, for my apache server):
hn=$(hostname)
echo $hn
tcpdump -s 0 -vvv -G 0 -w /opt/tmp/$hn.pcap -Z root &
sleep 5
#.....other commands that send packets to tcpdump.....
#now interrupt the process. get its PID:
pid=$(ps -e | pgrep tcpdump)
echo $pid
#interrupt it:
sleep 5
kill -2 $pid