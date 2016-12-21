#!/bin/sh

INSTALLDIR='/tmp'

#--------------------------------------------------------
echo 'Setting Up Python'
sudo scl enable rh-python35 bash
sudo echo '/opt/rh/rh-python35/root/usr/lib64' > /etc/ld.so.conf.d/python35.conf
sudo ldconfig
source /opt/rh/rh-python35/enable
sudo echo 'source /opt/rh/rh-python35/enable' >> /etc/bashrc
sudo perl -p -i -e 's|^(Defaults\s+secure_path.+)|$1:/opt/rh/rh-python35/root/usr/bin|' /etc/sudoers
sudo pip install --upgrade pip
sudo yum install libsodium-devel

#--------------------------------------------------------
echo 'Setting Up Anonymous Credentials'
cd $INSTALLDIR
git clone https://github.com/evernym/anoncreds.git
cd $INSTALLDIR/anoncreds
$INSTALLDIR/anoncreds/setup-charm.sh

#--------------------------------------------------------
echo 'Setting Up Sovrin'
sudo pip install sovrin
