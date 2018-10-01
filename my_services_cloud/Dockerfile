FROM resin/rpi-raspbian:latest

EXPOSE 80 

RUN apt-get update -y
RUN apt-get install -qy vim apache2

RUN a2enmod proxy proxy_http

COPY data/000-default.conf /etc/apache2/sites-available/000-default.conf

CMD /bin/bash -c "/usr/sbin/apache2ctl -D FOREGROUND"
