#!/bin/bash

set -e

# 1. Install dependencies
apt-get update
apt-get install -y curl unzip

# 2. Download Xray
mkdir -p /tmp/xray && cd /tmp/xray

XRAY_ZIP_URL=$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases/latest \
	| grep -oP '"browser_download_url":\s*"\Khttps://[^"]*Xray-linux-64.zip' \
	| head -n 1)

if [[ -z "$XRAY_ZIP_URL" ]]; then
	echo "❌ Failed to fetch Xray download URL."
	exit 1
fi

curl -LO "$XRAY_ZIP_URL"

# 3. Install Xray
unzip -o *.zip -d /usr/local/bin/
chmod +x /usr/local/bin/xray
mkdir -p /usr/local/etc/xray
chown -R xray:xray /usr/local/etc/xray
