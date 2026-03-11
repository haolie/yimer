#!/usr/bin/env bash
port=18002
pw=haolie
sudo wget –no-check-certificate -O showInstall.sh https://raw.githubusercontent.com/haolie/yimer/master/showInstall.sh
sudo chmod +x showInstall.sh
sudo ./showInstall.sh haolie $pw $port 2>&1 | tee shadowsocks.log
sed -i 's/collections.MutableMapping/collections.abc.MutableMapping/g' /usr/local/lib/python3.12/site-packages/shadowsocks-3.0.0-py3.12.egg/shadowsocks/lru_cache.py
sudo firewall-cmd --permanent --add-port=$port/tcp 
sudo firewall-cmd --reload
cd /etc/init.d/
sudo ./shadowsocks start