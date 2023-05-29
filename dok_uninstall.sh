echo " "
echo "--------------------Docker uninstallation--------------------"
echo " "
if command -v docker &> /dev/null; then
    echo "Package installed. Uninstalling package"

    sudo systemctl stop docker
    sudo systemctl disable docker
    sudo systemctl stop docker.socket
    sudo systemctl disable docker.socket
    
    sudo apt-get remove --purge docker-ce docker-ce-cli containerd.io -y
    sudo apt-get autoremove -y
    
    
    echo "Package uninstalled"
else
    echo "Package not installed. Skipping uninstallation"
fi
echo " "
echo "--------------------Uninstallation complete--------------------"
echo " "