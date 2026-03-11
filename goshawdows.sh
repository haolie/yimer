#!/bin/sh
sudo mkdir /home/temp
sudo chmod 777 /home/temp
sudo wget –no-check-certificate -O /home/temp/shadows https://raw.githubusercontent.com/haolie/yimer/master/shadows
sudo chmod +x /home/temp/shadows
sudo firewall-cmd --permanent --add-port=18002/tcp 
sudo firewall-cmd --reload
sudo /home/temp/shadows -s 'ss://AES-256-GCM:haolie@:18002' -verbose