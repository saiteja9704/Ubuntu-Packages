#!/bin/bash
echo "Select an option:"
echo "1. Pre-steps before installation"
echo "2. Install Vmware-services"

read -p "Enter your choice (1 or 2): " choice

if [[ $choice == 1 ]]; then
    # Option 1: Pre-steps before installation
 
    echo "Go to the website below and download the package:"
    echo "https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html"
    echo " check the Vmware version "17.0.2-21581411.x86_64" or not 
    echo "1. Open the terminal and navigate to the Downloads folder."
    echo "2. Right-click on the VMware file and select Properties."
    echo "3. Navigate to the Permissions tab, check the option 'Allow executing file as program,' and close the Properties window."
    echo "4. While still in the Downloads folder, right-click on the window and select 'Open in Terminal'."

elif [[ $choice == 2 ]]; then
    # Option 2: Install Vmware-services

    sudo apt update
    sudo apt install gcc build-essential
    sudo ./VMware-Workstation-Full-17.0.2-21581411.x86_64
    sudo vmware-modconfig --console --install-all

else
    echo "Invalid choice. Exiting..."
    exit 1
fi
