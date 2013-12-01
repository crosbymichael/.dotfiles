#!/bin/bash

go get -u github.com/golang/lint/golint
go get -u github.com/nsf/gocode
go get -u github.com/jstemmer/gotags
go build -o bin/server bin/server.go
