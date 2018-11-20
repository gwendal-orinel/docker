FROM debian:latest 

EXPOSE 80 443  

RUN apt-get update -y && apt-get install -qy wget git vim apache2 libapache2-mod-php php php7.0-mbstring php-mysql

RUN rm -r /var/www/html/* && git clone https://github.com/gwendal-orinel/Folio.git /var/www/html

RUN echo "<Directory \"/var/www/html\" >\n AllowOverride All \n</Directory>" >> /etc/apache2/apache2.conf

RUN a2enmod rewrite ssl && a2ensite default-ssl

CMD /bin/bash -c "service apache2 start && tail -f /var/log/apache2/access.log" 
 
 
 
