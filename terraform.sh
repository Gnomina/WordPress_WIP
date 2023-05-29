TERRAFORM_VERSION="1.4.6"
TERRAFORM_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
TERRAFORM_TMP_DIR="/tmp/terraform"

if sudo apt list --installed terraform 2>/dev/null | grep -q "^terraform"; then
    echo "Package already installed. Skip installation."
else
    echo "Package not installed. Installing package..."
    
    sudo mkdir -p $TERRAFORM_TMP_DIR
    sudo wget -O $TERRAFORM_TMP_DIR/terraform.zip $TERRAFORM_URL
    sudo unzip $TERRAFORM_TMP_DIR/terraform.zip -d $TERRAFORM_TMP_DIR
    sudo mv $TERRAFORM_TMP_DIR/terraform /usr/local/bin/

    sudo rm -rf $TERRAFORM_TMP_DIR
    sudo systemctl enable terraform
fi
