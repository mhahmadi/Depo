#!/usr/bin/env bash

sudo apt-get update

sudo apt-get install -y curl postgresql libpq-dev

sudo /usr/sbin/update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

sudo apt-get install -y curl
\curl -L https://get.rvm.io | sudo bash -s stable

source /usr/local/rvm/scripts/rvm

rvm requirements

rvm install 2.0.0
rvm use 2.0.0 --default

sudo apt-get install -y nodejs

gem install rails --version 4.0.0 --no-ri --no-rdoc