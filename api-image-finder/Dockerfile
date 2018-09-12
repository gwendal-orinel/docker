FROM debian:latest

EXPOSE 80

RUN apt-get update -y && apt-get install -qy curl vim apache2 libapache2-mod-php php php7.0-mbstring && rm -R /var/www/html/*

COPY data/* /var/www/html/

RUN echo "/bin/bash -c \"service apache2 start &> /dev/null && curl localhost/$1\"" >> /start.sh

ENTRYPOINT bash /start.sh

CMD [""]
