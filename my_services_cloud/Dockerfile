FROM debian:latest

EXPOSE 80 443

RUN apt-get update -y && apt-get install -qy wget vim apache2 libapache2-mod-php php php7.0-mbstring php-mysql

RUN a2enmod proxy proxy_http ssl 

COPY data/*.sh /var/
COPY data/options-ssl-apache.conf /etc/apache2/options-ssl-apache.conf

CMD /bin/bash -c "service apache2 start && tail -f /var/log/apache2/access.log"
