#!/bin/sh

export PROXY_PAC_URL="https://antizapret.prostovpn.org/proxy.pac"
export PROXY_IP_PORT=127.0.0.1:1080

curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:77.0) Gecko/20100101 Firefox/77.0" -L "https://antizapret.prostovpn.org/proxy.pac" | \
sed -E "s/return \".+DIRECT\"/return \"PROXY $PROXY_IP_PORT; DIRECT\"/" > ./proxy.pac
