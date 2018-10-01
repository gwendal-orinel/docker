FROM debian:latest

EXPOSE 80 

RUN apt-get update -y && apt-get install -qy vim apache2 wget

RUN a2enmod proxy proxy_http

COPY data/000-default.conf /etc/apache2/sites-available/000-default.conf

CMD /bin/bash -c "service apache2 start && tail -f /var/log/apache2/access.log"
