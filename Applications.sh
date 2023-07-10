#!/bin/bash

echo "Select an option:"
echo "1. Install packages"
echo "2. Remove packages"
read -p "Enter your choice (1 or 2): " choice

if [ $choice -eq 1 ]; then
  # Installation
  sudo apt update -y
  sudo apt upgrade -y
  sudo apy install gimp -y
  echo "gimp-paint installed successfully."
  
  sudo add-apt-repository ppa:achadwick/mypaint-testing
  sudo apt-get update -y
  sudo apt-get install mypaint -y
  echo "mypain installed successfully."
  
  wget https://zoom.us/client/latest/zoom_amd64.deb 
  sudo apt install ./zoom_amd64.deb 
  echo "zoom installed successfully."
  
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  sudo apt -f install
  sudo apt update -y
  sudo apt install google-chrome-stable -y
  echo "Chrome installed successfully."
 
  sudo snap install unofficial-webapp-todo -y
  sudo snap install office365webdesktop --beta
  sudo snap install unofficial-webapp-fork -y
  echo "0365 installed successfully."
  
  sudo snap install whatsapp-for-linux -y
  echo " whatsapp installed successfully."
  
  sudo apt-get install x2goclient -y
  echo "X2go installed successfully."

  DOWNLOAD_URL="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
  PACKAGE_NAME="vscode.deb"
  wget -O "$PACKAGE_NAME" "$DOWNLOAD_URL"
  sudo dpkg -i "$PACKAGE_NAME"
  sudo apt-get install -f
  echo "Visual Studio Code has been successfully installed."

  sudo apt install snapd -y
  sudo snap install notepad-plus-plus --classic
  echo "Notepad++ installed successfully."

  sudo apt update -y
  sudo apt upgrade -y

elif [ $choice -eq 2 ]; then
 
# Removal
sudo apt remove code -y
sudo apt remove gimp -y
sudo apt-get remove mypaint  -y
sudo apt remove zoom_amd64.deb 
sudo apt remove zoom -y
sudo apt remove --purge google-chrome-stable -y
sudo snap remove unofficial-webapp-todo
sudo snap remove office365webdesktop
sudo snap remove unofficial-webapp-fork
sudo add-apt-repository -r ppa:linuxuprising/shutter -y
sudo snap remove whatsapp-for-linux
sudo apt-get remove --purge x2goclient -y
sudo dpkg --remove vscode.deb
sudo snap remove notepad-plus-plus

# Cleanup
sudo apt autoremove -y
sudo apt autoclean

echo "Packages removed successfully."

else
  echo "Invalid choice. Exiting."
fi

