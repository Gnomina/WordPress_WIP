#!/bin/bash

#-------------------------jenkins installation-------------------------#
echo " "
echo "-----------------Jenkins----------------------------------------------"
echo " "
if sudo apt list --installed jenkins 2>/dev/null | grep -q "^jenkins"; then
    echo "Package already installed. Skipping installation"
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
echo " " 
echo "-----------------Ansible----------------------------------------------"
echo " "
if sudo apt list --installed ansible 2>/dev/null | grep -q "^ansible"; then
    echo "Package already installed. Skipping installation"
else
    echo "Package not installed. Install package"
    
    sudo apt-get update
    sudo apt-get install software-properties-common -y
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    sudo apt-get install ansible -y
        
fi
#-------------------------Terrform installation-------------------------#
echo " "
echo "-----------------Terraform--------------------------------------------"
echo " "
if command -v terraform &> /dev/null; then
    echo "Package already installed. Skipping installation."
else
    echo "Package not installed. Installing package..."
    TERRAFORM_VERSION="1.4.6"
    TERRAFORM_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
    TERRAFORM_TMP_DIR="/tmp/terraform"
    
    sudo mkdir -p $TERRAFORM_TMP_DIR
    sudo wget -O $TERRAFORM_TMP_DIR/terraform.zip $TERRAFORM_URL
    sudo unzip $TERRAFORM_TMP_DIR/terraform.zip -d $TERRAFORM_TMP_DIR
    sudo mv $TERRAFORM_TMP_DIR/terraform /usr/local/bin/

    sudo rm -rf $TERRAFORM_TMP_DIR
    terraform --version
fi
#-------------------------Docker installation-------------------------#
echo " "
echo "-----------------Docker-----------------------------------------------"
echo " "
if command -v docker &> /dev/null; then
    echo "Package already installed. Skipping installation"
else
    echo "Package not installed. Install package"
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
    if ! sudo apt-key list | grep -q "7EA0A9C3F273FCD8"; then
        sudo curl -fsSL -o /usr/share/keyrings/docker-archive-keyring.gpg https://download.docker.com/linux/ubuntu/gpg
        sudo apt-key add /usr/share/keyrings/docker-archive-keyring.gpg
    fi
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
    sudo usermod -aG docker $USER
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo systemctl status docker
fi
echo " "
echo "-----------------All packages already installed---------------------"
echo " "
echo "-----------------Java-----------------------------------------------"
echo " "
java --version
echo " "
echo "-----------------Jenkins--------------------------------------------"
echo " "
jenkins --version
echo " "
echo "-----------------Ansible--------------------------------------------"
echo " "
ansible --version
echo " "
echo "-----------------Terraform------------------------------------------"
echo " "
terraform --version
echo " "
echo "-----------------Docker---------------------------------------------"
echo " "
docker --version
echo " "
echo "-----------------End------------------------------------------------"

