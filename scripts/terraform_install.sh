#!/bin/bash

sudo apt update

sudo apt upgrade -y

sudo apt install -y unzip wget

wget https://releases.hashicorp.com/terraform/0.12.3/terraform_0.12.3_linux_amd64.zip 

unzip terraform*.zip

sudo rm -rf /usr/local/bin/terraform
sudo mv terraform /usr/local/bin/terraform
