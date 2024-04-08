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

# Install Node 16.20.2
export NVM_DIR=/usr/local/nvm
export NODE_VERSION=v16.20.2
sudo mkdir -p /usr/local/nvm
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
sudo /bin/bash -c "source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm use --delete-prefix $NODE_VERSION"
export NODE_PATH=$NVM_DIR/versions/node/$NODE_VERSION/bin

ENV PATH $NODE_PATH:$PATH
