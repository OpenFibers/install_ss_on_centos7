# 默认规则
iptables -A INPUT -p icmp --icmp-type any -j ACCEPT #允许icmp包进入
iptables -A INPUT -s localhost -d localhost -j ACCEPT #允许本地的数据包
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT #允许已经建立和相关的数据包进入
iptables -A OUTPUT -p icmp --icmp any -j ACCEPT #允许icmp包出去
iptables -A OUTPUT -s localhost -d localhost -j ACCEPT #允许本地数据包
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT #允许已经建立和相关的数据包出去
# 配置白名单
# 修改 local_ip_address 为本地 ip，修改 ssh_port 为远程 ssh 端口，修改 ss_port 为远程 ss 端口
# ssh
iptables -A INPUT -p tcp -s local_ip_address_1/16 --dport ssh_port -j ACCEPT
iptables -A INPUT -p tcp -s local_ip_address_2/16 --dport ssh_port -j ACCEPT
# ss tcp
iptables -A INPUT -p tcp -s local_ip_address_1/16 --dport ss_port -j ACCEPT
iptables -A INPUT -p tcp -s local_ip_address_2/16 --dport ss_port -j ACCEPT
# ss udp
iptables -A INPUT -p udp -s local_ip_address_1/16 --dport ss_port -j ACCEPT
iptables -A INPUT -p udp -s local_ip_address_2/16 --dport ss_port -j ACCEPT
# 设置默认的规则
iptables -P INPUT DROP # 配置默认的不让进
iptables -P FORWARD DROP # 默认的不允许转发
iptables -P OUTPUT ACCEPT # 默认的可以出去
