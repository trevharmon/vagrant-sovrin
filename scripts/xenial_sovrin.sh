#!/bin/bash

#--------------------------------------------------------
echo 'Setting Up Virtual Environment'
pip install --upgrade pip
pip3 install --upgrade pip

#--------------------------------------------------------
echo 'Setting Up Anonymous Credentials'
cd /tmp
git clone https://github.com/evernym/anoncreds.git
cd /tmp/anoncreds
/tmp/anoncreds/setup-charm.sh

#--------------------------------------------------------
echo 'Setting Up the Virtual Environment'
sudo -u vagrant -H pip install virtualenvwrapper
pip install virtualenvwrapper
echo ''                                           >> /etc/bash.bashrc
echo '# Python virtual environment wrapper'       >> /etc/bash.bashrc
echo 'export WORKON_HOME=$HOME/.virtualenvs'      >> /etc/bash.bashrc
echo 'source /usr/local/bin/virtualenvwrapper.sh' >> /etc/bash.bashrc
. /etc/bash.bashrc

#--------------------------------------------------------
echo 'Setting Up Sovrin'
su - vagrant ". /etc/bash.bashrc && mkvirtualenv -p python3.5 sovrin"
su - vagrant ". /etc/bash.bashrc && workon sovrin"
su - vagrant ". /etc/bash.bashrc && pip install sovrin"

#--------------------------------------------------------
echo 'Cleaning Up'
updatedb
