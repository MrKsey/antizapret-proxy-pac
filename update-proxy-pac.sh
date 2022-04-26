#!/bin/sh

export PROXY_PAC_URL="https://antizapret.prostovpn.org/proxy.pac"
export UA="Mozilla/5.0 (X11; Linux x86_64; rv:77.0) Gecko/20100101 Firefox/77.0"

# For local proxy (i.e. shadowsocks client for windows)
export LOCAL_PROXY=127.0.0.1:1080

# For remote proxy
export REMOTE_PROXY=proxy-pac.home.arpa:1080
# add in your system's or home router hosts file (/etc/hosts) an entry that specifies the hostname + IP address, where proxy server reside:
# 192.168.1.10     proxy-pac.home.arpa

export REMOTE_PROXY2=proxy-pac.home.arpa:8118

curl -A "$UA" -L "$PROXY_PAC_URL" | sed -E "s/return \".+DIRECT\"/return \"PROXY $LOCAL_PROXY; DIRECT\"/" > ./local.pac
cat ./local.pac | sed -E "s/return \"PROXY $LOCAL_PROXY; DIRECT\"/return \"PROXY $REMOTE_PROXY2; DIRECT\"/" > ./remote.pac
