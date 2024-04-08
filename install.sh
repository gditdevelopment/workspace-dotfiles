#!/bin/bash

# Install Terraform
wget --quiet https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_linux_amd64.zip \
  && unzip terraform_1.7.5_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_1.7.5_linux_amd64.zip
