#!/bin/bash

#-------------------------minikube installation-------------------------#
echo " "
echo "-----------------Minikube----------------------------------------------"
echo " "
if sudo apt list --installed Minikube 2>/dev/null | grep -q "^Minikube"; then
    echo "Package already installed. Skipping installation"
else
    echo "Package not installed. Install package"
    
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
    && chmod +x minikube

    

    sudo mkdir -p /usr/local/bin/
    sudo install minikube /usr/local/bin/
fi

echo "-----------------Minikube-----------------------------------------------"
echo " "
sudo apt list --installed Minikube
echo " "