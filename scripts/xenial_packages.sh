#!/bin/sh

echo "Installing Required Packages"
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install git vim ruby wget unzip python-setuptools software-properties-common
sudo add-apt-repository -y ppa:fkrull/deadsnakes
sudo apt-get update
sudo apt-get -y install python3.5 python3.5-dev python-pip python3-pip
sudo apt-get -y install libsodium-dev
