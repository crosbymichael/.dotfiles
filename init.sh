#!/bin/bash

# ssh michael@xxx wget https://raw.github.com/crosbymichael/.dotfiles/master/init.sh && chmod +x init.sh && sudo ./init.sh

apt-get update
apt-get install -y git-core

git clone https://github.com/crosbymichael/.dotfiles
cd .dotfiles/
git submodule update --init
./bootstrap.sh

echo "All done"
