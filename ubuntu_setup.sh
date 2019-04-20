#!/bin/sh

# change cwd to $HOME
cd 

# configure chrome repository
cat << EOD | sudo tee /etc/apt/sources.list.d/google-chrome.list
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
EOD

wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

# update package information
sudo apt update

# install packages
sudo apt -y install \
  google-chrome-stable \
  openvpn

# download nordvpn configuration files for openvpn
mkdir nordvpn
cd nordvpn
wget -O nordvpn.zip https://nordvpn.com/api/files/zip 
unzip -q nordvpn.zip
cd 

# install tresorit
wget https://installerstorage.blob.core.windows.net/public/install/tresorit_installer.run
chmod +x tresorit_installer.run
./tresorit_installer.run
