# here we create two lists.
# one list that contains all the ip networks from hosting providers:
# * Amazon Web Services / AWS, 
# * Hetzner, 
# * Hosteurope, 
# TODO
# * DigitalOcean (http://bgp.he.net/search?search%5Bsearch%5D=digitalocean&commit=Search)
# * OVH ( http://bgp.he.net/search?search%5Bsearch%5D=%22OVH+SAS%22&commit=Search )
# * online.com ( http://bgp.he.net/AS12876#_prefixes )
# * i3d.net ( http://bgp.he.net/AS49544#_prefixes )



LOCAL_IP=188.40.54.77

ipset create api_whitelisted_ips -exist hash:net timeout 0  
ipset create api_blocked_ips -exist list:set size 16

ipset add api_blocked_ips blacklist_aws
ipset add api_blocked_ips blacklist_HETZNER
ipset add api_blocked_ips blacklist_HOSTEUROPE

#iptables -A INPUT -m set --match-set api_whitelisted_ips src -p tcp -m tcp --dport 80 -j ACCEPT
#iptables -A INPUT -m set --match-set api_whitelisted_ips src -p tcp -m tcp --dport 443 -j ACCEPT

# if the src-addr is in the whitelist, accept the request
iptables -t nat -I PREROUTING -m set --match-set api_whitelisted_ips src --dst ${LOCAL_IP} -p tcp -m tcp --dport 80 -j ACCEPT
iptables -t nat -I PREROUTING -m set --match-set api_whitelisted_ips src --dst ${LOCAL_IP} -p tcp -m tcp --dport 443 -j ACCEPT

# if it is not in the whitelist, redirect to http-port that handles api requests and whitelisting
iptables -t nat -I PREROUTING -m set --match-set api_blocked_ips src --dst ${LOCAL_IP} -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 20080
iptables -t nat -I PREROUTING -m set --match-set api_blocked_ips src --dst ${LOCAL_IP} -p tcp -m tcp --dport 443 -j REDIRECT --to-ports 20080

