#!/usr/bin/env bash

sudo locale-gen en_US.UTF-8
sudo update-locale LANG=en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8

sudo apt-get update
sudo apt-get install -y build-essential git curl libxslt1-dev libxml2-dev libssl-dev

# rvm and ruby
su - vagrant -c 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3'
su - vagrant -c 'curl -sSL https://get.rvm.io | bash -s stable --ruby'
su - vagrant -c 'rvm rvmrc warning ignore allGemfiles'

# node
su - vagrant -c 'curl -s https://raw.githubusercontent.com/creationix/nvm/v0.14.0/install.sh | sh'
su - vagrant -c 'nvm install 4.2'
su - vagrant -c 'nvm alias default 4.2'

echo "All done installing!
Next steps: type 'vagrant ssh' to log into the machine."