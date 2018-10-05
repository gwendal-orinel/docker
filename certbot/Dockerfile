FROM certbot/certbot

EXPOSE 80 443

COPY data/options-ssl-apache.conf /var/certbot/options-ssl-apache.conf

# ./certbot-auto certonly --test-cert --standalone -n --agree-tos -m gwendal@orinel.net --work-dir /var/certbot --logs-dir /var/certbot --config-dir /var/certbot --preferred-challenges http-01  
CMD ["--help"]
