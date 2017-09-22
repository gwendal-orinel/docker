# Docker deployements

## Apache2
- Arm
```
docker build https://github.com/gwendal-orinel/docker.git#master:apache2 -t apache2
docker run -d --name=apache2 -h apache2 --restart=always -p 443:443 -p 80:80 apache2
```

## Plex
- Arm
```
docker create --name=plex --net=host -e PUID=0 -e PGID=0 -v /var/plex/config:/config -v /var/plex/data:/data/tvshows -v /var/plex/data:/data/movies -v /var/plex/transcode:/transcode lsioarmhf/plex
docker run -d --name=plex -h plex --restart=always lsioarmhf/plex
```

## Transmission
- Arm
```
docker create --name=transmission -h transmission -v /var/transmission/config:/config -v /var/transmission/downloads:/downloads -v /var/transmission/watch:/watch -e PGID=0 -e PUID=0 -e TZ=FR -p 9091:9091 lsioarmhf/transmission
docker run -d --name=transmission -h transmission --restart=always lsioarmhf/transmission
```

## Sickrage
- Arm
```
docker create --name=sickrage -v /var/transmission/downloads:/downloads -v /var/plex/data:/tv -v /var/sickrage/config:/config -e PGID=0 -e PUID=0 -e TZ=FR -p 8081:8081 lsioarmhf/sickrage
docker run -d --name=sickrage -h sickrage --restart=always lsioarmhf/sickrage
```

## Portainer
- Arm/x86/x64
```
docker run -d --name=ui  -p 9000:9000 -e PUID=0 -e PGID=0 -v /var/run/docker.sock:/var/run/docker.sock -v /var/portainer/data:/data portainer/portainer
```

## Consul
- Arm
```
docker build https://github.com/gwendal-orinel/docker.git#master:consul -t consul
docker run -d --name=consul --restart=always -p 8300-8302:8300-8302/tcp -p 8300-8302:8300-8302/udp -p 8500:8500/tcp -p 8600:8600/tcp -p 8600:8600/udp -p 80:80 consul
```
