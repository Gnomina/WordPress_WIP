#!/bin/bash

#-------------------------jenkins installation-------------------------#
if apt list --installed jenkins 2>/dev/null | grep -q "^jenkins"; then
    echo "Package already installed. Skip instalation"
else
    echo "Package not installed. Install package"
    
    sudo apt-get update
    sudo apt-get install openjdk-11-jdk -y

    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
               /usr/share/keyrings/jenkins-keyring.asc > /dev/null
	
    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
                /etc/apt/sources.list.d/jenkins.list > /dev/null

    sudo apt-get update && sudo apt upgrade
    sudo apt-get install jenkins -y

    sudo systemctl start jenkins
    sudo systemctl enable jenkins
fi
#-------------------------ansible installation-------------------------#
if apt list --installed ansible 2>/dev/null | grep -q "^ansible"; then
    echo "Package already installed. Skip instalation"
else
    echo "Package not installed. Install package"
    
    sudo apt-get update
    sudo apt-get install software-properties-common -y
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt-get install ansible -y
    sudo systemctl enable ansible
fi
#-------------------------Terrform installation-------------------------#
if apt list --installed terraform 2>/dev/null | grep -q "^terraform"; then
    echo "Package already installed. Skip instalation"
else
    echo "Package not installed. Install package"
    TERRAFORM_VERSION="1.4.6"
    TERRAFORM_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
    TERRAFORM_TMP_DIR="/tmp/terraform"

    wget $TERRAFORM_URL
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
    sudo mv terraform /usr/local/bin/

    rm -rf $TERRAFORM_TMP_DIR
    sudo systemctl enable terraform
fi
#-------------------------Docker installation-------------------------#
if apt list --installed docker 2>/dev/null | grep -q "^docker"; then
    echo "Package already installed. Skip instalation"
else
    echo "Package not installed. Install package"
    sudo apt-get update
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    sudo usermod -aG docker $USER
    sudo systemctl enable docker
fi
echo " ----------------Installation completed successfully----------------"
java --version
echo "--------------------------------------------------------------------"
jenkins --version
echo "--------------------------------------------------------------------"
ansible --version
echo "--------------------------------------------------------------------"
terraform --version
echo "--------------------------------------------------------------------"
docker --version
echo "--------------------------------------------------------------------"

