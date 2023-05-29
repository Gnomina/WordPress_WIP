#!/bin/bash

#-------------------------jenkins uninstallation-------------------------#
echo " "
echo "--------------------Jenkins uninstallation--------------------"
echo " "
if sudo apt list --installed jenkins 2>/dev/null | grep -q "^jenkins"; then
    echo "Package installed. Uninstalling package"
    
    sudo systemctl stop jenkins
    sudo systemctl disable jenkins
    sudo apt-get remove --purge jenkins -y
    sudo apt-get autoremove -y
    sudo userdel jenkins

    
    echo "Package uninstalled"
else
    echo "Package not installed. Skipping uninstallation"
fi

#-------------------------ansible uninstallation-------------------------#
echo " "
echo "--------------------Ansible uninstallation--------------------"
echo " "
if sudo apt list --installed ansible 2>/dev/null | grep -q "^ansible"; then
    echo "Package installed. Uninstalling package"
    
    sudo apt-get remove --purge ansible -y
    sudo apt-get autoremove -y
    
    echo "Package uninstalled"
else
    echo "Package not installed. Skipping uninstallation"
fi

#-------------------------terraform uninstallation-------------------------#
echo " "
echo "--------------------Terraform uninstallation--------------------"
echo " "
if command -v terraform &> /dev/null; then
    echo "Package installed. Uninstalling package"
    
    sudo rm /usr/local/bin/terraform
    
    echo "Package uninstalled"
else
    echo "Package not installed. Skipping uninstallation"
fi

#-------------------------docker uninstallation-------------------------#
echo " "
echo "--------------------Docker uninstallation--------------------"
echo " "
if command -v docker &> /dev/null; then
    echo "Package installed. Uninstalling package"
    
    sudo apt-get remove --purge docker-ce docker-ce-cli containerd.io -y
    sudo apt-get autoremove -y
    
    echo "Package uninstalled"
else
    echo "Package not installed. Skipping uninstallation"
fi
echo " "
echo "--------------------Uninstallation complete--------------------"