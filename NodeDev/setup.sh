#!/bin/bash

echo "checking if git is installed"

sudo apt-get install git-core -y

echo "cloning the repo pls wait"

git clone https://github.com/Code52/saywat.git

echo "running npm install"

cd saywat && sudo npm install

echo "starting up the machine pls wait"
echo "this may take a while, have a cup of coffee"

vagrant up
