#!/bin/sh

echo "Installing Required Packages"
yum -y update
yum -y upgrade
yum -y install centos-release-scl
yum -y install kernel-devel git vim ruby wget unzip rh-python35 rh-python35-python-sphinx python-setuptools mlocate
yum clean all
yum -y groupinstall "Development Tools"
updatedb
