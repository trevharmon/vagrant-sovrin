#!/bin/bash

echo "Installing Required Packages"
apt-get update
apt-get -y upgrade
apt-get -y install git vim ruby wget unzip python-setuptools software-properties-common
add-apt-repository -y ppa:fkrull/deadsnakes
apt-get update
apt-get -y install python3.5 python3.5-dev python-pip python3-pip
apt-get -y install libsodium-dev
