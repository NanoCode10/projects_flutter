#!/bin/sh

echo 1 > /proc/sys/net/ipv4/ip_forward
/sbin/modprobe ip_conntrack_ftp

echo "setting global variables"
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
iptables="/sbin/iptables"
eth0="enp4s0" # WAN
eth1="enp3s0" # LAN
 
# adjust /proc
echo "applying general security settings to /proc filesystem"
if [ -e /proc/sys/net/ipv4/tcp_syncookies ]; then echo 1 > /proc/sys/net/ipv4/tcp_syncookies; fi
if [ -e /proc/sys/net/ipv4/conf/all/rp_filter ]; then echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter; fi
if [ -e /proc/sys/net/ipv4/ip_forward ]; then echo 1 > /proc/sys/net/ipv4/ip_forward; fi

 
# load some modules
if [ -e /lib/modules/`uname -r`/kernel/net/ipv4/netfilter/ip_nat_irc.o ]; then modprobe ip_nat_irc; fi
if [ -e /lib/modules/`uname -r`/kernel/net/ipv4/netfilter/ip_conntrack_irc.o ]; then modprobe ip_conntrack_irc; fi
if [ -e /lib/modules/`uname -r`/kernel/net/ipv4/netfilter/ip_conntrack_ftp.o ]; then modprobe ip_conntrack_ftp; fi
if [ -e /lib/modules/`uname -r`/kernel/net/ipv4/netfilter/ip_nat_ftp.o ]; then modprobe ip_nat_ftp; fi
 

# flush any existing chains and set default policies
$iptables -F INPUT
$iptables -F OUTPUT
$iptables -F FORWARD
$iptables -F -t nat
$iptables -P INPUT DROP
$iptables -P OUTPUT ACCEPT


# setup nat
echo "applying nat rules"
$iptables -F FORWARD
$iptables -F -t nat
$iptables -P FORWARD DROP

# Esto hace que cierta ip no pueda salir por el pueto 80 y 443
#$iptables -A FORWARD -i $eth1 -s 192.168.11.40 -p tcp --dport 80 -j DROP
#$iptables -A FORWARD -i $eth1 -s 192.168.11.40 -p tcp --dport 443 -j DROP

$iptables -A FORWARD -i $eth1 -j ACCEPT
$iptables -A INPUT -i $eth1 -j ACCEPT
$iptables -A OUTPUT -o $eth1 -j ACCEPT
$iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT


# allow all packets on the loopback interface
$iptables -A INPUT -i lo -j ACCEPT
$iptables -A OUTPUT -o lo -j ACCEPT
 

# allow established and related packets back in
$iptables -A INPUT -i $eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT


# blocking reserved private networks incoming from the internet
echo "applying incoming internet blocking of reserved private networks"
##$iptables -I INPUT -i eth0 -s 172.16.0.0/12 -j DROP
$iptables -I INPUT -i $eth0 -s 127.0.0.0/8 -j DROP
##$iptables -I FORWARD -i eth0 -s 10.0.0.0/8 -j DROP
##$iptables -I FORWARD -i eth0 -s 172.16.0.0/12 -j DROP
$iptables -I FORWARD -i $eth0 -s 127.0.0.0/8 -j DROP


# icmp
echo "applying icmp rules"
$iptables -A OUTPUT -p icmp -m state --state NEW -j ACCEPT
$iptables -A INPUT -p icmp -m state --state ESTABLISHED,RELATED -j ACCEPT
$iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -i $eth0 -j ACCEPT


# apply icmp type match blocking
echo "applying icmp type match blocking"
$iptables -I INPUT -p icmp --icmp-type redirect -j DROP
$iptables -I INPUT -p icmp --icmp-type router-advertisement -j DROP
$iptables -I INPUT -p icmp --icmp-type router-solicitation -j DROP
$iptables -I INPUT -p icmp --icmp-type address-mask-request -j DROP
$iptables -I INPUT -p icmp --icmp-type address-mask-reply -j DROP
 

# open ports to the firewall
echo "applying the open port(s) to the firewall rules"
$iptables -A INPUT -p tcp --dport 805 -j ACCEPT
$iptables -A INPUT -p udp --dport 1193 -j ACCEPT


# open and forward ports to the internal machine(s)
echo "applying port forwarding rules"
$iptables -A FORWARD -i $eth0 -p tcp --dport 805 -j ACCEPT
$iptables -A FORWARD -i $eth0 -p udp --dport 1193 -j ACCEPT


# habilitar fordward para la placa de la VPN
$iptables -A FORWARD -o tun0 -j ACCEPT
$iptables -A FORWARD -i tun0 -j ACCEPT
$iptables -A INPUT -i tun0 -j ACCEPT
$iptables -A OUTPUT -o tun0 -j ACCEPT


# drop all other packets
echo "applying default drop policies"
$iptables -A INPUT -i $eth0 -p tcp --dport 0:65535 -j DROP
$iptables -A INPUT -i $eth0 -p udp --dport 0:65535 -j DROP


echo "quicktables is loaded"
##PC con conexion directa a internet
$iptables -t nat -A POSTROUTING -s 192.168.11.0/24 -o tun0 -j MASQUERADE
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.2/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.20/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.21/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.40/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.45/255.255.255.255 -j MASQUERADE # pc call 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.46/255.255.255.255 -j MASQUERADE # pc call 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.47/255.255.255.255 -j MASQUERADE # pc call 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.48/255.255.255.255 -j MASQUERADE # pc call 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.49/255.255.255.255 -j MASQUERADE # Laptop Juan 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.50/255.255.255.255 -j MASQUERADE #Samanta
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.51/255.255.255.255 -j MASQUERADE #koky
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.52/255.255.255.255 -j MASQUERADE #Alejandros
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.53/255.255.255.255 -j MASQUERADE #
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.54/255.255.255.255 -j MASQUERADE #GeraldineR
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.55/255.255.255.255 -j MASQUERADE #Roxana Chambieo
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.56/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.57/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.58/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.59/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.60/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.61/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.62/255.255.255.255 -j MASQUERADE # Fappiano 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.63/255.255.255.255 -j MASQUERADE #Claudia Lucero
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.64/255.255.255.255 -j MASQUERADE #Ricardo Babich
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.65/255.255.255.255 -j MASQUERADE #Legales ex juanpi
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.66/255.255.255.255 -j MASQUERADE #Dario Castro
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.67/255.255.255.255 -j MASQUERADE #Silvio
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.68/255.255.255.255 -j MASQUERADE #Andrea
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.69/255.255.255.255 -j MASQUERADE #Rodolfo
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.70/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.71/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.72/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.73/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.74/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.75/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.76/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.77/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.78/255.255.255.255 -j MASQUERADE #ip rrhh 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.79/255.255.255.255 -j MASQUERADE #ip rodo
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.80/255.255.255.255 -j MASQUERADE #ip ana
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.81/255.255.255.255 -j MASQUERADE #ip juan
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.82/255.255.255.255 -j MASQUERADE #ip cdc
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.83/255.255.255.255 -j MASQUERADE #ip call
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.84/255.255.255.255 -j MASQUERADE #ip call
#$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.99/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.100/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.101/255.255.255.255 -j MASQUERADE #Natalia Decima
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.102/255.255.255.255 -j MASQUERADE  
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.103/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.104/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.105/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.106/255.255.255.255 -j MASQUERADE #Natalia Cirelli 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.107/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.108/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.109/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.110/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.111/255.255.255.255 -j MASQUERADE #Legales Fabian 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.112/255.255.255.255 -j MASQUERADE #Mariela Medicacion
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.113/255.255.255.255 -j MASQUERADE #Yamila Medicacion
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.114/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.115/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.116/255.255.255.255 -j MASQUERADE #Doctor Toski
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.117/255.255.255.255 -j MASQUERADE  # Mariano Arenas escritorio
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.118/255.255.255.255 -j MASQUERADE #Guido 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.119/255.255.255.255 -j MASQUERADE #Medica Auditora
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.200/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.201/255.255.255.255 -j MASQUERADE  #Eze escritorio
#$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.202/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.203/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.204/255.255.255.255 -j MASQUERADE 
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.205/255.255.255.255 -j MASQUERADE
$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.0/255.255.255.0 -j MASQUERADE
#$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.142/255.255.255.255 -j MASQUERADE
#$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.132/255.255.255.255 -j MASQUERADE
#$iptables -t nat -A POSTROUTING -o $eth0 -s 192.168.11.173/255.255.255.255 -j MASQUERADE
