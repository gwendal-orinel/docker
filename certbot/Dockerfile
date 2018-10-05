FROM debian:latest

EXPOSE 80 443

RUN apt-get update -y && apt-get install -qy wget 

RUN wget https://dl.eff.org/certbot-auto && chmod a+x certbot-auto

ENTRYPOINT ./certbot-auto certonly --test-cert --standalone -n --agree-tos -m gwendal@orinel.net --work-dir /var/certbot --logs-dir /var/certbot --config-dir /var/certbot --preferred-challenges http-01  
CMD ["--help"]
