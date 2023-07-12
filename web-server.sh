#!/bin/bash

echo "Select an option:"
echo "1. Install services"
echo "2. Remove services"

read -p "Enter your choice (1 or 2): " choice

if [[ $choice == 1 ]]; then
    # Option 1: Install services
   
    sudo apt update
    sudo apt upgrade -y
    
    sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
    sudo apt install caddy
     echo "caddy installation completed."

    echo "Installing Nginx..."
    sudo apt update
    sudo apt install -y nginx
    sudo systemctl restart nginx
    sudo systemctl stop nginx
    echo "Nginx installation completed."

    echo "Installing Apache2..."
    sudo apt update
    sudo apt install -y apache2
    sudo systemctl restart apache2
    sudo systemctl stop apache2
    echo "Apache2 installation completed."

    echo "Checking service status..."
    sudo systemctl status nginx
    sudo systemctl status caddy
    sudo systemctl status apache2

elif [[ $choice == 2 ]]; then
    # Option 2: Remove services
    echo "Removing Caddy..."
    sudo systemctl stop caddy
    sudo remove install -y debian-keyring debian-archive-keyring apt-transport-https
    sudo apt remove -y caddy
    sudo rm /usr/share/keyrings/caddy-stable-archive-keyring.gpg
    sudo rm /etc/apt/sources.list.d/caddy-stable.list
    echo "Caddy removal completed."

    echo "Removing Nginx..."
    sudo apt remove -y nginx
    echo "Nginx removal completed."

    echo "Removing Apache2..."
    sudo apt remove -y apache2
    echo "Apache2 removal completed."

else
    echo "Invalid choice. Exiting..."
    exit 1
fi
