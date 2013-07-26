#!/bin/bash

wget -O go.tar.gz https://go.googlecode.com/files/go1.1.1.linux-amd64.tar.gz | tar -zxvf -C /usr/local

rm go.tar.gz

go get github.com/golang/lint/golint
go get github.com/nsf/gocode
go get github.com/dotcloud/docker
