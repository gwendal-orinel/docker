FROM debian:latest

EXPOSE 80 443 

#ENV bdd_user bdd_pass bdd_host

RUN apt-get update -y && apt-get install -qy wget git vim apache2 libapache2-mod-php php php7.0-mbstring php-mysql

RUN rm -r /var/www/html/* && git clone https://github.com/gwendal-orinel/Folio.git /var/www/html

RUN echo "export BDD_USER=\"$bdd_user\"\nexport BDD_PASS=\"$bdd_pass\"\nexport BDD_HOST=\"$bdd_host\"" >> /etc/apache2/envvars

CMD /bin/bash -c "service apache2 start && tail -f /var/log/apache2/access.log"
