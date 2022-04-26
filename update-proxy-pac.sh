#!/bin/sh

export PROXY_PAC_URL="https://antizapret.prostovpn.org/proxy.pac"
export UA="Mozilla/5.0 (X11; Linux x86_64; rv:77.0) Gecko/20100101 Firefox/77.0"

# For local proxy (i.e. shadowsocks client for windows)
export LOCAL_PROXY=127.0.0.1:1080

curl -A "$UA" -L "$PROXY_PAC_URL" | sed -E "s/return \".+DIRECT\"/return \"PROXY $LOCAL_PROXY; DIRECT\"/" > ./local.pac
