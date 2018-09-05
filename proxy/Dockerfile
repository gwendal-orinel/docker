FROM debian:latest

EXPOSE 80

RUN apt-get update -y && apt-get install -qy wget vim apache2 libapache2-mod-php php php-xml php7.0-mbstring php-curl 

RUN rm -f /www/var/html/* && wget -O /tmp/index.php https://github.com/joshdick/miniProxy/raw/master/miniProxy.php && mv /tmp/index.php /www/var/html/

CMD /bin/bash -c "service apache2 start && tail -f /var/log/apache2/access.log"
