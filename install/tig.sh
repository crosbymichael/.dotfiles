#!/bin/bash 

cd /home/michael/.dotfiles/build/

git clone git://github.com/jonas/tig.git

cd tig

./autogen.sh

./configure --prefix=$HOME/.dotfiles/local

make && make install
