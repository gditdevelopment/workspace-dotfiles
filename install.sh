#!/bin/bash

cd $HOME

# Set the locale
sudo sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && sudo locale-gen
export LANG=en_US.UTF-8  
export LANGUAGE=en_US:en  
export LC_ALL=en_US.UTF-8 

# Install Terraform 1.7.5
wget --quiet https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_linux_amd64.zip \
  && unzip terraform_1.7.5_linux_amd64.zip \
  && sudo mv terraform /usr/bin \
  && rm terraform_1.7.5_linux_amd64.zip
# =====================================

# Install AWS CLIv2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && sudo ./aws/install
# ====================================

# Install Node 16.20.2
export NVM_DIR="$HOME/.nvm"
NODE_VERSION="v16.20.2"

if [ ! -d "$NVM_DIR" ]; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
else
    echo "NVM is already installed."
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if [ $(nvm list | grep -c "$NODE_VERSION") -eq 0 ]; then
    echo "Installing Node.js $NODE_VERSION..."
    nvm install $NODE_VERSION
else
    echo "Node.js $NODE_VERSION is already installed."
fi

nvm use --delete-prefix $NODE_VERSION
export NODE_PATH=$(nvm which current)
export PATH=$NODE_PATH:$PATH
# ==================================

# Install Poetry
curl -sSL https://install.python-poetry.org | python3 -
export PATH="/home/coder/.local/bin:$PATH"
# ==================================

# Install Git Completions
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o .git-completion.bash
source ~/.git-completion.bash
# ==================================

