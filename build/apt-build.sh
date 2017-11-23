#!/bin/bash

set -eux
apt-get -yq update
apt-get -yq install build-essential
apt-get -yq install curl
apt-get -yq install autoconf
apt-get -yq install zlib1g-dev
apt-get -yq install libncurses5-dev
apt-get -yq install libpstreams-dev
apt-get -yq install libreadline6-dev
apt-get -yq install libcurl4-openssl-dev
apt-get -yq install libboost-dev
apt-get -yq install libboost-iostreams-dev
apt-get -yq install libexpat1-dev
apt-get -yq install libglib2.0-dev
apt-get -yq install unzip
apt-get -yq install libcairo2-dev
apt-get -yq install software-properties-common
apt-get -yq install gfortran
apt-get -yq install bsdtar
apt-get -yq install libwww-perl
apt-get -yq install git
apt-get -yq install wget

### security upgrades and cleanup
apt-get -yq install unattended-upgrades
unattended-upgrades
apt -yq autoremove
apt-get clean
