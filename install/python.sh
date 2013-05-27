#!/bin/bash

# Setup script for local python install

echo "Starting install for python 2.7.5"

mkdir -p $HOME/.local/build
cd $HOME/.local/build/

wget http://python.org/ftp/python/2.7.5/Python-2.7.5.tgz

tar -zxvf Python-2.7.5.tgz
cd Python-2.7.5/

./configure --prefix=$HOME/.local

make && make install

cd $HOME/.local/build/

wget http://python-distribute.org/distribute_setup.py 
wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py

$HOME/.local/bin/python distribute_setup.py
$HOME/.local/bin/python get-pip.py


$HOME/.local/bin/pip install virtualenv
