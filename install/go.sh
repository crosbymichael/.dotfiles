#!/bin/bash

echo "Installing go toolchain to /usr/local"

esys=$(uname)
if [ $esys = Darwin ]
    then
       wget -O - https://go.googlecode.com/files/go1.1.darwin-amd64.tar.gz | tar -zxvf -C /usr/local
    else
        wget -O - https://go.googlecode.com/files/go1.1.linux-amd64.tar.gz | tar -zxvf -C /usr/local
fi

