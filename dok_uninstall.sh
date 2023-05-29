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
echo " "