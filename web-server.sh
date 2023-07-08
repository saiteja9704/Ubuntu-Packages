#!/bin/bash

# Function to install packages
install_packages() {
    # Install Caddy
    echo "Installing Caddy..."
    sudo apt update
    sudo apt upgrade -y
    sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
    sudo apt update
    sudo apt install -y caddy
    sudo systemctl restart caddy
    sudo systemctl stop caddy
    echo "Caddy installation completed."

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
}

# Function to remove packages
remove_packages() {
    # Remove Caddy
    echo "Removing Caddy..."
    sudo apt remove -y caddy
    sudo rm /usr/share/keyrings/caddy-stable-archive-keyring.gpg
    sudo rm /etc/apt/sources.list.d/caddy-stable.list
    echo "Caddy removal completed."

    # Remove Nginx
    echo "Removing Nginx..."
    sudo apt remove -y nginx
    echo "Nginx removal completed."

    # Remove Apache2
    echo "Removing Apache2..."
    sudo apt remove -y apache2
    echo "Apache2 removal completed."
}

# Read user input
read -p "Enter 1 to install packages or 2 to remove packages: " choice

# Execute script based on user input
if [ "$choice" == "1" ]; then
    install_packages
elif [ "$choice" == "2" ]; then
    remove_packages
else
    echo "Invalid choice. Exiting..."
    exit 1
fi


