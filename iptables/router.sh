# Delete
iptables -t nat -F
iptables -t nat -X
iptables -t nat -Z
iptables -F
iptables -X
iptables -Z

# Policy
iptables -P INPUT DROP
iptables -P FORWARD DROP

# Basic
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -i externa0 -j ACCEPT

# DHCP-DNS
iptables -A INPUT -i interna0 -p tcp --dport 53 -s 10.0.20.0/27 -j ACCEPT
iptables -A INPUT -i interna0 -p udp --dport 53 -s 10.0.20.0/27 -j ACCEPT
iptables -A INPUT -i interna0 -p udp --dport 67 -s 10.0.20.0/27 -j ACCEPT

# Forward
iptables -A FORWARD -i interna0 -o externa0 -s 10.0.20.0/27 -j ACCEPT
iptables -A FORWARD -i externa0 -o interna0 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# NAT
iptables -A POSTROUTING -o externa0 -j MASQUERADE

# Port Forward
#iptables -A FORWARD -p tcp --dport 5000 -i externa0 -o interna0 -j ACCEPT
#iptables -A PREROUTING -i externa0 -j DNAT --to-destination 10.0.20.11[:5000]

