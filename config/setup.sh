#!/bin/bash

./xray_download.sh
./xray_start.sh
./add_proxy.sh
./neovim_install.sh
./neovim_config.sh
./npm_install.sh
. ~/.bashrc
