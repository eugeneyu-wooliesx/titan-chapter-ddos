#!/bin/sh

/sbin/sysctl -w net/netfilter/nf_conntrack_tcp_loose=0
/sbin/sysctl -w net/ipv4/tcp_timestamps=1
/sbin/sysctl -w net/ipv4/tcp_syncookies=1

iptables -t raw -A PREROUTING -i eth0 -p tcp -m tcp --syn --dport 8888 -j CT --notrack
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 8888 -m conntrack --ctstate INVALID,UNTRACKED -j SYNPROXY --sack-perm --timestamp --wscale 7 --mss 1460
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP
