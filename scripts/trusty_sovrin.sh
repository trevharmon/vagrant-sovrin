#!/bin/bash

BASHRC='/home/vagrant/.bashrc'
INSTALLDIR='/tmp'

#--------------------------------------------------------
echo 'Setting Up Virtual Environment'
pip install --upgrade pip
( cd /home/vagrant && pip install virtualenvwrapper )
echo ''                                           >> $BASHRC
echo '# Python virtual environment wrapper'       >> $BASHRC
echo 'export WORKON_HOME=$HOME/.virtualenvs'      >> $BASHRC
echo 'source /usr/local/bin/virtualenvwrapper.sh' >> $BASHRC
source $BASHRC

#--------------------------------------------------------
echo 'Setting Up Anonymous Credentials'
cd $INSTALLDIR
git clone https://github.com/evernym/anoncreds.git
cd $INSTALLDIR/anoncreds
$INSTALLDIR/anoncreds/setup-charm.sh

#--------------------------------------------------------
echo 'Setting Up Sovrin'
sudo -u vagrant bash <<"EOS"
  cd /home/vagrant                   && \
  mkvirtualenv -p python3.5 sovrin   && \
  workon sovrin                      && \
  pip install sovrin-dev
EOS

#--------------------------------------------------------
echo 'Cleaning Up'
updatedb
