#!/usr/bin/env bash
apt-get update -y -qq > /dev/null
apt-get install curl -y -qq > /dev/null

# Menginstal mysql server
export DEBIAN_FRONTEND=noninteractive

apt-get -y install mysql-server
apt-get -y install build-essential libmysqlclient-dev zlib1g-dev ruby-full

# Menginstal postgresql
apt-get install postgresql postgresql-contrib -y -qq > /dev/null
apt-get install libpq-dev -y -qq > /dev/null

# Menginstal libxslt
apt-get -y install libxslt-dev libxml2-dev
# Menginstal imagemagick
apt-get -y install imagemagick libmagickwand-dev
# Menginstal nodejs
apt-get -y install nodejs


# Menginstal mongodb
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
apt-get update -y -qq > /dev/null
sudo apt-get -y install mongodb-org

# Menginstal RVM dan Ruby versi terbaru 
\curl -L https://get.rvm.io | bash -s stable --ruby
source /usr/local/rvm/scripts/rvm
rvm install 2.4.0
rvm use 2.4.0 --default

# Menginstal Rails
gem install rails --no-ri --no-rdoc

# Menginstal package tambahan
gem install bundler
gem install mysql2
gem install pg
gem install rake

