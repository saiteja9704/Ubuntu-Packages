#!/bin/bash
echo "Application link"
echo "https://snapcraft.io/install/zerotier/ubuntu
echo "Select an option:"
echo "1. Install services"
echo "2. Remove services"

read -p "Enter your choice (1 or 2): " choice

if [[ $choice == 1 ]]; then
    # Option 1: Install services

sudo apt update
sudo apt install snapd
sudo snap install zerotier
touch /var/lib/zerotier-one/local.conf
cd  /var/lib/zerotier-one/
chmod 777 /var/lib/zerotier-one/local.conf

# Open local.conf in a text editor
vi local.conf <<EOF
{
  "settings": {
    "primaryPort": 9994
  }
}
EOF

sudo systemctl restart zerotier-one.service
#Start ZeroTier in daemon mode
zerotier-one -d
echo "Join a Blusapphire-ZeroTier network "
zerotier-cli join 81b9052ecd4865a9
sudo apt upgrade
sudo apt update
echo "ZeroTier has been installed."
echo "zerotier.cli join 81b9052ecd4865a9"
echo "zerotier-cli info or zerotier.cli info"

elif [[ $choice == 2 ]]; then
    # Option 2: Remove services
	
sudo systemctl stop zerotier-one.service
sudo snap remove zerotier
sudo rm -rf /var/lib/zerotier-one
rm -rf ~/.zerotier
sudo rm -rf /etc/systemd/system/zerotier-one.service
sudo rm -rf /etc/zerotier-one
sudo rm /usr/bin/zerotier-cli
sudo rm /usr/sbin/zerotier-idtool
sudo rm /usr/sbin/zerotier-one
sudo apt upgrade
sudo apt update 
echo "ZeroTier has been removed."

else
    echo "Invalid choice. Exiting..."
    exit 1
fi

