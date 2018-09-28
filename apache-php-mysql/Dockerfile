FROM debian:latest

EXPOSE 443

RUN apt-get update -y && apt-get install -qy wget vim apache2 libapache2-mod-php php php7.0-mbstring mysql-server 

RUN /usr/bin/mysqladmin -u root password $SQL_PASSWORD

CMD /bin/bash -c "service apache2 start && service mysql start && tail -f /var/log/apache2/access.log"
