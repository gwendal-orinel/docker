FROM resin/rpi-raspbian:latest

EXPOSE 80

RUN apt-get update -y && apt-get install -qy vim apache2

COPY data/* /var/www/html/.

ENTRYPOINT ["service apache2 start && curl localhost/images/?"]

CMD [""]
