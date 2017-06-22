#!/usr/bin/env bash

service iptables stop
iptables -P INPUT ACCEPT
iptables -F
iptables -X
iptables -Z
iptables -A INPUT -i lo -j ACCEPT 
iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
service iptables save
service iptables start