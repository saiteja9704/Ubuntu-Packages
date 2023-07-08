#!/bin/bash

if [ "$1" == "install" ]; then
    # Script 1 - Installation
    sudo apt update -y
    sudo apt upgrade -y

    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt -f install
    sudo apt update -y
    sudo apt install google-chrome-stable
    echo "Chrome installed successfully."

    sudo apt-get install x2goclient
    echo "X2go installed successfully."

    sudo apt install software-properties-common apt-transport-https wget
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo apt install code
    echo "VS Code installed successfully."

    sudo apt install snapd -y
    sudo snap install notepad-plus-plus --classic
    echo "Notepad++ installed successfully."

    sudo apt update -y
    sudo apt upgrade -y

elif [ "$1" == "remove" ]; then
    # Script 2 - Removal
    sudo apt remove google-chrome-stable -y
    sudo apt remove x2goclient -y
    sudo apt remove code -y
    sudo snap remove notepad-plus-plus

    echo "Packages removed successfully."

else
    echo "Invalid argument. Please specify 'install' or 'remove'."

fi

