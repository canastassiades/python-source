#!/bin/bash

if [ $# -lt 1 ]; then
    exit 1
fi

source scl_source enable devtoolset-11

sudo yum-builddep python

cd $1/openssl-1.1.1w
sudo ./config --prefix=/opt/openssl
sudo make
sudo make install

cd $1/Python-3.12.1
sudo ./configure --prefix=/opt/python/3.12 --enable-optimizations --with-lto --with-openssl=/opt/openssl --with-openssl-rpath=auto
sudo make
sudo make altinstall
