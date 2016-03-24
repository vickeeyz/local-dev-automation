#!/bin/bash

echo "setting home dir"
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
echo "current dir is" = $dir
echo "checking and installing prerequisites"
sleep 1
sudo apt-get update -y
sudo apt-get install software-properties-common git-core -y
sleep 2
cd /tmp/
if [ $(sudo dpkg-query -l | grep virtualbox | wc -l) -eq 0 ];
then
  echo "installing virtualbox"
  wget -v http://download.virtualbox.org/virtualbox/5.0.16/virtualbox-5.0_5.0.16-105871~Ubuntu~trusty_amd64.deb;
  sudo dpkg -i virtualbox-5.0_5.0.16-105871~Ubuntu~trusty_amd64.deb;
fi
sleep 1
if [ $(sudo dpkg-query -l | grep vagrant | wc -l) -eq 0 ];
then
  echo "installing vagrant"
  wget -v https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb;
  sudo dpkg -i vagrant_1.8.1_x86_64.deb;
fi
sleep 1
if [ $(sudo dpkg-query -l | grep ansible | wc -l) -eq 0 ];
then
  echo "installing ansible"
  sudo apt-add-repository ppa:ansible/ansible -y;
  sudo apt-get update -y;
  sudo apt-get install ansible -y;
fi
sleep 1
echo "Done!"
sleep 2
echo "Sit back and have a cup of coffee while we build your dev environment"
cd $dir
echo "cloning the repo pls wait"
git clone https://github.com/Code52/saywat.git
echo "running npm install"
cd saywat && sudo npm install
echo "starting up the machine pls wait"
echo "this may take a while, have a cup of coffee"

vagrant up
