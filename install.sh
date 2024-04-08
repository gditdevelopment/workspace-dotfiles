#!/bin/bash

cd $HOME

# Install Terraform 1.7.5
wget --quiet https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_linux_amd64.zip \
  && unzip terraform_1.7.5_linux_amd64.zip \
  && sudo mv terraform /usr/bin \
  && rm terraform_1.7.5_linux_amd64.zip

# Install AWS CLIv2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && sudo ./aws/install
