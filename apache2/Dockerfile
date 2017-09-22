FROM resin/rpi-raspbian:latest
ENTRYPOINT []

EXPOSE 80 443

VOLUME /etc/apache2

RUN apt-get update -y && apt-get install -qy vim apache2

RUN a2enmod proxy proxy_http rewrite

CMD /bin/bash -c "service apache2 start && tail -f /var/log/apache2/access.log"
