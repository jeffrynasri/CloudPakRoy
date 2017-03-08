#!/usr/bin/env bash
apt-get update
apt-get install -y apache2
apt-get update
apt-get install -y python-software-properties
add-apt-repository ppa:ondrej/php
apt-get update
apt-get install -y php7.0
