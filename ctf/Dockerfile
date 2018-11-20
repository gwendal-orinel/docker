FROM debian:latest 

EXPOSE 80 443  

RUN apt-get update -y && apt-get install -qy wget git vim unzip apache2 libapache2-mod-php php php7.0-mbstring php-mysql

RUN rm -r /var/www/html/*

RUN wget https://github.com/MSIR2018/CFI-CTF/blob/master/Docker/Host/Data/backupweb.zip
RUN unzip backupweb.zip /var/www/html/

RUN echo "<Directory \"/var/www/html\" >\n AllowOverride All \n</Directory>" >> /etc/apache2/apache2.conf

CMD /bin/bash -c "service apache2 start && tail -f /var/log/apache2/access.log" 
