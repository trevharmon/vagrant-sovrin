#!/bin/sh

INSTALLDIR='/tmp'
BASHRC='/etc/bash.bashrc'

#--------------------------------------------------------
echo 'Setting Up Virtual Environment'
sudo pip install --upgrade pip
sudo pip3 install --upgrade pip # Cludge pip to point to `python3`
#sudo -H pip install virtualenvwrapper
#sudo echo '' >> $BASHRC
#sudo echo '# Python virtual environment wrapper' >> $BASHRC
#sudo echo 'export WORKON_HOME=$HOME/.virtualenvs' >> $BASHRC
#sudo echo 'source /usr/local/bin/virtualenvwrapper.sh' >> $BASHRC
#source $BASHRC

#--------------------------------------------------------
echo 'Setting Up Anonymous Credentials'
cd $INSTALLDIR
git clone https://github.com/evernym/anoncreds.git
cd $INSTALLDIR/anoncreds
$INSTALLDIR/anoncreds/setup-charm.sh

#--------------------------------------------------------
echo 'Setting Up Sovrin'
#mkvirtualenv -p python3.5 sovrin
pip install sovrin
#workon sovrin
