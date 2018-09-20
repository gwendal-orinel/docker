FROM resin/rpi-raspbian:latest

EXPOSE 80 443

RUN apt-get update -y && apt-get install -qy vim apache2

RUN a2enmod proxy proxy_http

COPY data/000-default.conf /etc/apache2/sites-available/000-default.conf

CMD /bin/bash -c "sed -i 's/URL/$url/g' /etc/apache2/sites-available/000-default.conf && service apache2 start && tail -f /var/log/apache2/access.log"
