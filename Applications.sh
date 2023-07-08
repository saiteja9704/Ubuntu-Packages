#!/bin/bash

echo "Select an option:"
echo "1. Install packages"
echo "2. Remove packages"
read -p "Enter your choice (1 or 2): " choice

if [ $choice -eq 1 ]; then
  # Installation
  sudo apt update -y
  sudo apt upgrade -y

  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  sudo apt -f install
  sudo apt update -y
  sudo apt install google-chrome-stable
  echo "Chrome installed successfully."

  sudo snap install unofficial-webapp-todo
  sudo snap install office365webdesktop --beta
  sudo snap install unofficial-webapp-fork
  echo "0365 installed successfully."
  sudo add-apt-repository -y ppa:linuxuprising/shutter

 
  sudo snap install whatsapp-for-linux
  echo " whatsapp installed successfully."
  
  sudo apt-get install x2goclient
  echo "X2go installed successfully."

 # sudo apt install software-properties-common apt-transport-https wget
 # wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
 # sudo apt install code
 # echo "VS Code installed successfully."

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
  rm "$PACKAGE_NAME"
  sudo apt remove google-chrome-stable -y
  sudo snap remove whatsapp-for-linux
  sudo apt remove x2goclient -y
  sudo apt remove code -y
  sudo snap remove notepad-plus-plus
  echo "Packages removed successfully."

else
  echo "Invalid choice. Exiting."
fi

