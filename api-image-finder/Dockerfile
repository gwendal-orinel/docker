FROM debian:latest

EXPOSE 80

RUN apt-get update -y && apt-get install -qy curl vim apache2 libapache2-mod-php php && rm -R /var/www/html/*

COPY data/* /var/www/html/

RUN echo "/bin/bash -c \"service apache2 start && curl localhost $1\" >> start.sh"

ENTRYPOINT /bin/bash start.sh

CMD [""]
