

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
