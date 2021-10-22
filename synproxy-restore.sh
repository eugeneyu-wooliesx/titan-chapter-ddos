#!/bin/sh

iptables -t raw -F
iptables -t raw -X
iptables -F
iptables -X