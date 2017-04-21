#!/usr/bin/env bash
apt-get update
apt-get install -y apache2
apt-get update
apt-get install libapache2-mod-php7.0
service apache2 restart

