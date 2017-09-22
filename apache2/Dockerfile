FROM resin/rpi-raspbian:latest
ENTRYPOINT []

EXPOSE 80 443

RUN apt-get update -y && apt-get install -qy vim apache2

RUN a2enmod proxy proxy_http rewrite

VOLUME /data
COPY data/000-default.conf /etc/apache2/sites-available/000-default.conf

CMD /bin/bash -c "service apache2 start && tail -f /var/log/apache2/access.log"
