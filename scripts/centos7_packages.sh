#!/bin/sh

echo "Installing Required Packages"
sudo yum -y update
sudo yum -y upgrade
sudo yum -y install centos-release-scl
sudo yum -y install kernel-devel git vim ruby wget unzip rh-python35 python-setuptools
sudo yum clean all
sudo yum -y groupinstall "Development Tools"
