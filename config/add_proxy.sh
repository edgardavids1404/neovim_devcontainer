!/bin/bash

http_proxy_line='export HTTP_PROXY=http://127.0.0.1:10808'
https_proxy_line='export HTTPS_PROXY=http://127.0.0.1:10808'

# File to modify
bashrc="$HOME/.bashrc"

# Add HTTP_PROXY if not present
if ! grep -q "^export HTTP_PROXY=http://127.0.0.1:10808" "$bashrc"; then
	echo "$http_proxy_line" >> "$bashrc"
fi

# Add HTTPS_PROXY if not present
if ! grep -q "^export HTTPS_PROXY=http://127.0.0.1:10808" "$bashrc"; then
	echo "$https_proxy_line" >> "$bashrc"
fi

# Source the updated ~/.bashrc
. "$bashrc"


