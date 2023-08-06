# to flush NAT tables
iptables -t nat -F

# to allow other students to access APACHE server
iptables -t nat -A PREROUTING -p tcp --dport 18127 -j DNAT --to-destination 172.17.127.37:80

# to allow other students to access MySQL server
iptables -t nat -A PREROUTING -p tcp --dport 16127 -j DNAT --to-destination 172.17.127.37:3306

# to allow other students to access Linux server - SSH
iptables -t nat -A PREROUTING -p tcp --dport 12127 -j DNAT --to-destination 172.17.127.37:22

# to allow other students to access IIS server
iptables -t nat -A PREROUTING -p tcp --dport 19127 -j DNAT --to-destination 172.17.127.36:80

# to allow other students to access Windows server - RDP
iptables -t nat -A PREROUTING -p tcp --dport 13127 -j DNAT --to-destination 172.17.127.36:3389

# POST ROUTING
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE