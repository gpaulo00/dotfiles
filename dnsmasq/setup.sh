#!/bin/bash

# backup files
mv /etc/dnsmasq.conf{,.bak}
mv /etc/resolv.conf{,.bak}

# copy new files
cp ./* /etc/

# restart dnsmasq
systemctl restart dnsmasq