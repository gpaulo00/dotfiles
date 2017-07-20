#!/bin/bash
# -*- coding: utf-8 -*-
#
# Gustavo Paulo <gustavo.paulo.segura@gmail.com>
# Reglas para el firewall iptables.

# configuration variables
## general
iptables=/sbin/iptables
LOG="-m limit --limit 5/minute --limit-burst 10 -j LOG --log-level 4"

## states
ESTABLECIDO="-m conntrack --ctstate ESTABLISHED,RELATED"
NUEVO="-m conntrack --ctstate NEW"

## ports
PROTECTED=(38825)
OPEN=(4444 4884 9889)


# clean tables
tables=(filter nat mangle)
for table in ${tables[*]}; do
    $iptables -t $table -F
    $iptables -t $table -X
    $iptables -t $table -Z
done


# chains
## ports supervisor
BF_SLOW="-m recent --name bruteforce --rttl --rcheck --hitcount 6 --seconds 1800"
BF_FAST="-m recent --name bruteforce --rttl --rcheck --hitcount 3 --seconds 10"

$iptables -N supervisar
$iptables -A supervisar $BF_FAST $LOG --log-prefix 'bruteforce: '
$iptables -A supervisar $BF_FAST -j DROP
$iptables -A supervisar $BF_SLOW $LOG --log-prefix 'bruteforce: '
$iptables -A supervisar $BF_SLOW -j DROP

$iptables -A supervisar -m recent --set --name bruteforce -j ACCEPT


# basic config
## default "DROP" policy
$iptables -P INPUT DROP
$iptables -P FORWARD DROP

## allow from loopback and established connections
$iptables -A INPUT -i lo -j ACCEPT
$iptables -A INPUT $ESTABLECIDO -j ACCEPT

## log invalid packets
$iptables -A INPUT -m conntrack --ctstate INVALID $LOG --log-prefix "iptables: invalid packet: "
$iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

## allow from my network
$iptables -A INPUT -i "wlan0" -s "192.168.1.1/24" -j ACCEPT

## supervise ports (protect)
for port in ${PROTECTED[*]}; do
    $iptables -A INPUT $NEW -p tcp --dport $port -j supervisar
done
