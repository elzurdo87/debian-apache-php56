# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
FROM elzurdo87/debian-last-ssh

MAINTAINER elzurdo87


run wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

run echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

run apt-get update 

#apache 
run apt-get install -y apache2 curl

#php
run apt-get install -y php5.6 libapache2-mod-php5.6 php-pear php5.6-dev 

run echo 1 | update-alternatives --config php

run echo "<?php phpinfo(); ?>" > /var/www/html/info.php

#run sed '1 i ServerName localhost' /etc/apache2/sites-available/000-default.conf

run mkdir -p /var/www/doc_root
run curl -Ls https://raw.githubusercontent.com/elzurdo87/debian-apache-php56/master/000-default.conf --output /etc/apache2/sites-available/000-default.conf

#copy ./000-default.conf /etc/apache2/sites-available/


ENV APACHE_RUN_USER www-data 
ENV APACHE_RUN_GROUP www-data 
ENV APACHE_LOG_DIR /var/log/apache2 
RUN /usr/sbin/a2ensite default-ssl
#RUN /usr/sbin/a2enmod ssl

EXPOSE 80 
EXPOSE 443 

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]