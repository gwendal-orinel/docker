# Docker deployements

## Apache-Php
```
docker build https://github.com/gwendal-orinel/docker.git#master:apache-php-mysql -t gorinel/apache-php
docker run -d --name=apache-php -h apache-php -e 'MYSQL_PASS=PASSWORD' --restart=always -p 80:80 -p 443:443 gorinel/apache-php
```

## MySql
```
docker run -d --name mysql -h mysql --restart always -e MYSQL_ROOT_PASSWORD=password -v /var/docker/mysql:/var/lib/mysql mysql
```

## Reverse-proxy (Apache2)
- Arm/x86
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
- Arm/x86/x64
```
docker run -d --name=ui  -p 9000:9000 -e PUID=0 -e PGID=0 -v /var/run/docker.sock:/var/run/docker.sock -v /data --restart=always portainer/portainer
```

## Consul
- Arm
```
docker build https://github.com/gwendal-orinel/docker.git#master:consul -t consul
docker run -d --name=consul --restart=always -p 8300-8302:8300-8302/tcp -p 8300-8302:8300-8302/udp -p 8500:8500/tcp -p 8600:8600/tcp -p 8600:8600/udp -p 80:80 consul
```

## miniProxy
- Arm/x86/x64
```
docker build https://github.com/gwendal-orinel/docker.git#master:proxy -t miniproxy
docker run -d --name=proxy -h proxy --restart=always -p 80:80 miniproxy
```

## api-image-finder
- Arm/x86/x64
```
docker build https://github.com/gwendal-orinel/docker.git#master:api-image-finder -t api-image-finder
docker run api-image-finder "?q=gwendal+orinel&count=1&format=json&engine=google"
```

## OwnCloud
- x86/64
```
docker run -d -v /var/www/owncloud:/var/www/html -p 81:80 --restart=always --name owncloud owncloud
```
