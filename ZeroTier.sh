#!/bin/bash
echo "Application link"
echo "https://snapcraft.io/install/zerotier/ubuntu"

sudo apt upgrade -y
sudo apt update -y
sudo apt install curl -y

curl -s https://install.zerotier.com | sudo bash
curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import && \
if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi

# Define the file path and content
file_path="/var/lib/zerotier-one/local.conf"
file_content='{ "settings": { "primaryPort": 9994 } }'

# Create the file with the specified content
echo "$file_content" > "$file_path"

# Confirm the file creation
if [ -e "$file_path" ]; then
echo "local.conf file created successfully""
else
echo  "local.conf file created fail"
fi

#permistions change
sudo chmod -R 777  /var/lib/zerotier-one/local.conf/local.conf 

#join blusapphire network
zerotier-cli join 81b9052ecd4865a9

sudo systemctl restart zerotier-one.service

echo "please note the address"
erotier-cli info
