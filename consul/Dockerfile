FROM resin/rpi-raspbian:latest
ENTRYPOINT []

EXPOSE 80 8600 8500
EXPOSE 8600/udp
EXPOSE 8300-8302
EXPOSE 8301-8302/udp

RUN apt-get update -y && \
        apt-get install -qy curl unzip apache2 && \
        curl -o consul.zip https://releases.hashicorp.com/consul/0.9.2/consul_0.9.2_linux_arm.zip && \
        curl -o consul-template.zip https://releases.hashicorp.com/consul-template/0.19.2/consul-template_0.19.2_linux_arm.zip && \
        unzip consul.zip && unzip consul-template.zip && rm *.zip &&\
        mv consul* /bin/

RUN a2enmod proxy proxy_http rewrite

VOLUME /consul
RUN chgrp -R 0 /consul && chmod -R g+rwX /consul
COPY data/* /consul/

CMD /bin/bash -c "service apache2 start && /bin/consul-template -template \"/consul/data/vhost.tmp:/etc/apache2/sites-available/000-default.conf:service apache2 restart\" & /bin/consul agent -config-file /consul/data/config.json -advertise-wan 192.168.0.19 -advertise 192.168.0.19"
