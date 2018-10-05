FROM debian:latest

EXPOSE 80 443

RUN apt-get update -y && apt-get install -qy wget vim curl

RUN wget https://dl.eff.org/certbot-auto && chmod a+x certbot-auto

CMD tail -f /dev/null
