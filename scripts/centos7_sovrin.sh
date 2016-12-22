#!/bin/bash

INSTALLDIR='/tmp'

#--------------------------------------------------------
echo 'Setting Up Python'
scl enable rh-python35 bash
echo '/opt/rh/rh-python35/root/usr/lib64' > /etc/ld.so.conf.d/python35.conf
ldconfig
source /opt/rh/rh-python35/enable
yum install -y rh-python35-python-sphinx
echo 'source /opt/rh/rh-python35/enable' >> /etc/bashrc
perl -p -i -e 's|^(Defaults\s+secure_path.+)|$1:/opt/rh/rh-python35/root/usr/bin|' /etc/sudoers
pip install --upgrade pip
wget https://bootstrap.pypa.io/ez_setup.py -O - | python
sudo -u vagrant -H pip install virtualenvwrapper
pip install virtualenvwrapper
echo ''                                      >> /etc/bashrc
echo '# Python virtual environment wrapper'  >> /etc/bashrc
echo 'export WORKON_HOME=$HOME/.virtualenvs' >> /etc/bashrc
echo 'source /opt/rh/rh-python35/root/usr/bin/virtualenvwrapper.sh'  >> /etc/bashrc

#--------------------------------------------------------
echo 'Setting Up Anonymous Credentials'
cd $INSTALLDIR
git clone https://github.com/evernym/anoncreds.git
cd $INSTALLDIR/anoncreds
$INSTALLDIR/anoncreds/setup-charm.sh

#--------------------------------------------------------
echo 'Setting Up Sovrin'
sudo -u vagrant bash <<"EOS"
  source ~/.bashrc
  mkvirtualenv -p python3.5 sovrin
  workon sovrin
  pip install sovrin
EOS

#--------------------------------------------------------
echo 'Cleaning Up'
updatedb
