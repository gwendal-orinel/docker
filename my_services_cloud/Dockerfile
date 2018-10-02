FROM debian:latest

EXPOSE 80 443

RUN apt-get update -y && apt-get install -qy wget vim apache2 libapache2-mod-php php php7.0-mbstring php-mysql

RUN a2enmod proxy proxy_http 

COPY data/000-default.conf /etc/apache2/sites-available/000-default.conf

CMD /bin/bash -c "service apache2 start && tail -f /var/log/apache2/access.log"
