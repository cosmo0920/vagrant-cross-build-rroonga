#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y install git build-essential ruby mingw-w64

su -c "/vagrant/user-build.sh" vagrant
