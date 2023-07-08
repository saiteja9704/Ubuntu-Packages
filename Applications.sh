#!/bin/bash

sudo apt  update  -y
sudo apt upgrade  -y

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt -f install
sudo apt  update  -y
sudo apt install google-chrome-stable
echo "chrome-install-successfully"

sudo apt-get install x2goclient
#sudo yum install x2goclient
echo "X2go-install-successfully"

sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo apt install code
echo "VS-code-successfully"

sudo apt install snapd -y
# Install Notepad++ via Snap
sudo snap install notepad-plus-plus --classic
echo "Notepad++ -successfully"

sudo apt  update  -y
sudo apt upgrade  -y
