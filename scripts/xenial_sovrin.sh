#!/bin/bash

INSTALLDIR='/tmp'
BASHRC='/etc/bash.bashrc'

#--------------------------------------------------------
echo 'Setting Up Virtual Environment'
pip install --upgrade pip
pip3 install --upgrade pip # Kludge pip to point to `python3`

#--------------------------------------------------------
echo 'Setting Up Anonymous Credentials'
cd $INSTALLDIR
git clone https://github.com/evernym/anoncreds.git
cd $INSTALLDIR/anoncreds
$INSTALLDIR/anoncreds/setup-charm.sh

#--------------------------------------------------------
echo 'Setting Up Sovrin'
pip install sovrin

#--------------------------------------------------------
echo 'Cleaning Up'
updatedb
