# Sections:
  - [Docker deployements](./README.md#docker-deployements)
  - [Gitlab Runner](./README.md#gitlab-runner)



# Docker deployements
## Apache-Php
```
docker build https://github.com/gwendal-orinel/docker.git#master:apache-php -t gorinel/apache-php
docker run -d --name=apache-php -h apache-php --restart=always -p 80:80 -p 443:443 gorinel/apache-php
```

## MySql
```
docker run --restart always --name mysql -e MYSQL_ROOT_PASSWORD=password -v mysql:/var/lib/mysql -d mysql:5.7
```

## CertBot
```
docker run --rm -v certbot:/var/certbot -p 9080:80 certbot/certbot certonly --standalone -n --agree-tos --work-dir /tmp --logs-dir /var/certbot/logs --config-dir /var/certbot --preferred-challenges http-01 -d $DOMAIN
```

## Reverse-proxy (Apache2)
```
docker build https://github.com/gwendal-orinel/docker.git#master:reverse-proxy -t gorinel/reverse-proxy
docker run -d --name=reverse-proxy -h reverse-proxy -e 'url=http://IP:PORT/' --restart=always -p 80:80 gorinel/reverse-proxy
```

## Plex
- Arm
```
docker run -d --restart=always --name=plex --net=host -e PUID=0 -e PGID=0 -v /var/plex/config:/config -v /var/plex/data:/data/tvshows -v /var/plex/data:/data/movies -v /var/plex/transcode:/transcode lsioarmhf/plex
```

## Transmission
- Arm
```
docker run -d --name=transmission -h transmission --restart=always -v /var/transmission/config:/config -v /var/transmission/downloads:/downloads -v /var/transmission/watch:/watch -e PGID=0 -e PUID=0 -e TZ=FR -p 9091:9091 l
sioarmhf/transmission
```
 
## Sickrage
- Arm
```
docker run -d --restart=always --name=sickrage -v /var/transmission/downloads:/downloads -v /var/plex/data:/tv -v /var/sickrage/config:/config -e PGID=0 -e PUID=0 -e TZ=FR -p 8081:8081 lsioarmhf/sickrage
```

## Portainer
```
docker run -d --name=ui  -p 9000:9000 -e PUID=0 -e PGID=0 -v /var/run/docker.sock:/var/run/docker.sock -v /data --restart=always portainer/portainer
```

## Consul
- Arm
```
docker build https://github.com/gwendal-orinel/docker.git#master:consul -t consul
docker run -d --name=consul --restart=always -p 8300-8302:8300-8302/tcp -p 8300-8302:8300-8302/udp -p 8500:8500/tcp -p 8600:8600/tcp -p 8600:8600/udp -p 80:80 consul
```

## Vizualiser Swarm
- Arm
```
docker service create --name=viz --publish=5000:8080 --constraint=node.role==manager --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock alexellis2/visualizer-arm:latest
```

## Graphana
- Arm
```
docker service create -d -p 3000:3000 --name grafana fg2it/grafana-armhf:v5.1.4
```

## OpenFaas
- Arm
```
git clone https://github.com/openfaas/faas && cd faas && ./deploy_stack.armhf.sh #openfaas
faas deploy -g http://IP:PORT -f stack_arm.yml #stack exemple
```

## MiniProxy
```
docker build https://github.com/gwendal-orinel/docker.git#master:proxy -t miniproxy
docker run -d --name=proxy -h proxy --restart=always -p 80:80 miniproxy
```

## Api-image-finder
```
docker build https://github.com/gwendal-orinel/docker.git#master:api-image-finder -t api-image-finder
docker run api-image-finder "?q=gwendal+orinel&count=1&format=json&engine=google"
```

## OwnCloud
```
docker run -d -v owncloud:/var/www/html -p 80:80 --restart=always --name owncloud owncloud
```

## Nextcloud
```
docker run -d --restart=always -p 80:80 -v nextcloud:/var/www/html --name nextcloud nextcloud
```

## NodeRed
```
docker run -it -p 80:1880 -d --name mynodered nodered/node-red-docker
```

## My Services Cloud
```
docker build https://github.com/gwendal-orinel/docker.git#master:my_services_cloud -t gorinel/my_services_cloud
docker run -d --name=my_services_cloud -h my_services_cloud --restart=always -p 80:80 -p 8080:443 gorinel/my_services_cloud
```

# Gitlab Runner
## X86_64 Runner
- Install in Docker
```
docker run -d --name gitlab-runner --restart always -h gitlab-runner  -v /var/docker/gitlab-runner/config:/etc/gitlab-runner -v /var/run/docker.sock:/var/run/docker.sock   gitlab/gitlab-runner:latest
```

- Register
```
docker exec -it gitlab-runner gitlab-runner register -n --url https://gitlab.com/ --registration-token $CI_REGISTRATION_TOKEN   --executor docker --description "Runner X86/X64" --docker-image "docker:stable" --tag-list "runner" --docker-volumes /var/run/docker.sock:/var/run/docker.sock
```

## ARM Runner
- Install in Docker
```
docker run -d --name arm-runner --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /var/docker/gitlab-runner/config:/etc/gitlab-runner klud/gitlab-runner
```

- Register
```
docker exec -it arm-runner gitlab-runner register -n --url https://gitlab.com/ --registration-token $CI_REGISTRATION_TOKEN  --executor docker --description "Runner ARM" --docker-image "docker:stable" --tag-list "runner_arm" --docker-volumes /var/run/docker.sock:/var/run/docker.sock
```
