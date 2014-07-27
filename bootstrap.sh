#!/usr/bin/env bash

sudo /usr/sbin/update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

sudo apt-get update

MYSQL_ROOT_PASSWORD="root"
MYSQL_USER_PASSWORD="vagrant"

echo "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD" | debconf-set-selections
sudo apt-get -y install apache2 curl git vim mysql-client mysql-server libmysql-ruby libmysqlclient-dev

\curl -L https://get.rvm.io | sudo bash -s stable

source /usr/local/rvm/scripts/rvm

rvm requirements

rvm install 2.0.0
rvm use 2.0.0 --default

sudo apt-get -y install nodejs
gem install rails --version 4.0.0 --no-ri --no-rdoc

echo "CREATE DATABASE depot_production DEFAULT CHARACTER SET utf8;" | mysql -u root -p$MYSQL_ROOT_PASSWORD
echo "CREATE USER 'vagrant'@'localhost' " | mysql -u root -p$MYSQL_ROOT_PASSWORD
echo "GRANT ALL PRIVILEGES ON depot_production.* TO 'vagrant'@'localhost' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';" | mysql -u root -p$MYSQL_ROOT_PASSWORD
