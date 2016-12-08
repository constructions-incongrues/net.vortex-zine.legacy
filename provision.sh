#!/usr/bin/env bash

# Profil ABT
PROFILE=${1:=vagrant}
echo "profile=$PROFILE"

# Mise à jour des dépots
apt-get -qq update

# Configuration de la timezone
echo "Europe/Paris" > /etc/timezone
apt-get install -y tzdata
dpkg-reconfigure -f noninteractive tzdata

# Installation de Apache et PHP
apt-get -y install apache2 php5-cli

# Configuration du projet
apt-get install -y ant
cd /vagrant
./composer.phar install --prefer-dist --no-progress
ant configure build -Dprofile=${PROFILE}

# Mise à disposition du projet dans Apache
ln -sf /vagrant/src/web/* /var/www/html/

# Informations
echo
echo -e "Le site est disponible à l'adresse : http://vortex.vagrant.test/"
