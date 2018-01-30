#!/bin/bash
#
# Gustavo Paulo <gustavo.paulo.segura@gmail.com>
# share network with ethernet cable
#

# config
WAN1=wlxf8d1115f0aa7
WAN2=wlp4s2
NAT=enp3s0
NETWORK=192.168.12.1/24

# set ip address
ip link set dev $NAT down
ip link set dev $NAT up
ip addr add $NETWORK dev $NAT

# turn on ip forwarding
sysctl net.ipv4.ip_forward=1

# configure firewall
iptables -A FORWARD -o $WAN1 -i $NAT -s $NETWORK -m conntrack --ctstate NEW -j ACCEPT
iptables -A FORWARD -o $WAN2 -i $NAT -s $NETWORK -m conntrack --ctstate NEW -j ACCEPT
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -F POSTROUTING
iptables -t nat -A POSTROUTING -o $WAN1 -j MASQUERADE
iptables -t nat -A POSTROUTING -o $WAN2 -j MASQUERADE
