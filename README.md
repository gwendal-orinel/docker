# Docker deployements

## Apache2
- Arm
```
docker build https://github.com/gwendal-orinel/docker.git#master:apache2 -t apache2
docker run -d --name=apache2 -h apache2 --restart=always -p 1443:443 -p 80:80 apache2
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
