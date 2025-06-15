#!/bin/bash

# Met à jour les paquets
yum update -y

# Installe Apache et Git
yum install -y httpd git

# Installe PHP
amazon-linux-extras enable php8.0
yum clean metadata
yum install -y php

# Démarre Apache et l'active au boot
sudo systemctl start httpd
systemctl enable httpd

# Se place dans /var/www/html
cd /var/www/html

# Supprime l’index par défaut
rm -f index.html

# Clone le repo GitHub
git clone https://github.com/Jounaid-CH/ChercheUnFilm.git

# Déplace le fichier PHP à la racine du serveur web
cp ChercheUnFilm/index.php /var/www/html/

# Donne les bons droits
sudo chown apache:apache /var/www/html/index.php

# Redémarre Apache (par précaution)
sudo systemctl restart httpd
