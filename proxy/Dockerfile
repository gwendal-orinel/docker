FROM resin/rpi-raspbian:latest

EXPOSE 80

RUN apt-get update -y && apt-get install -qy vim apache2 libapache2-mod-php php php-xml php7.0-mbstring php-curl 

COPY data/* /www/var/html/

CMD /bin/bash -c "service apache2 start && tail -f /var/log/apache2/access.log"
