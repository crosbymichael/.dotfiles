#!/bin/bash

ssh prod -L 4001:127.0.0.1:4001 -N
