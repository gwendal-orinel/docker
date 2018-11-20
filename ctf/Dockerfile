FROM debian:latest 

EXPOSE 80 443  

RUN apt-get update -y && apt-get install -qy wget git vim unzip apache2 libapache2-mod-php php php7.0-mbstring php-mysql

RUN rm -r /var/www/html/*

RUN wget -O /tmp/backupweb.zip https://github.com/MSIR2018/CFI-CTF/raw/master/Docker/Host/Data/backupweb.zip
RUN unzip /tmp/backupweb.zip -d /var/www/

COPY data/login_bdd.php /var/www/html/php/include/login_bdd.php

RUN echo "<Directory \"/var/www/html\" >\n AllowOverride All \n</Directory>" >> /etc/apache2/apache2.conf

CMD /bin/bash -c "service apache2 start && tail -f /var/log/apache2/access.log" 
 
