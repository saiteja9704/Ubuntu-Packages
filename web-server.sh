#!/bin/bash 

#https://caddyserver.com/docs/install
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy
sudo systemctl restart caddy
sudo systemctl stop caddy
echo "caddy installation completed."

# Install Nginx
echo "Installing Nginx..."
sudo apt update
sudo apt install -y nginx
sudo systemctl restart nginx
sudo systemctl stop nginx
echo "Nginx installation completed."

# Install Apache2
echo "Installing Apache2..."
sudo apt update
sudo apt install -y apache2
sudo systemctl restart apache2
sudo systemctl stop apache2
echo "Apache2 installation completed."


# Check service status
echo "Checking service status..."
sudo systemctl status nginx
sudo systemctl status caddy
sudo systemctl status apache2
