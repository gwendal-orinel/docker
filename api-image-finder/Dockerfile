FROM debian:latest

EXPOSE 80

RUN apt-get update -y && apt-get install -qy curl vim apache2 libapache2-mod-php php && rm -R /var/www/html/*

COPY data/* /var/www/html/

ENTRYPOINT ["/bin/bash","-c"] 

CMD ["\'service apache2 start &> /dev/null && curl localhost\'"]
