# Docker deployements

## Apache2
- Arm
```
docker build https://github.com/gwendal-orinel/docker.git#master:apache2 -t apache2
docker run -d --name=apache2 -h apache2 --restart=always -p 443:443 -p 80:80 -v /var/apache2/data/000-default.conf:/etc/apache2/sites-available/000-default.conf:z apache2
```

## Plex
- Arm
```
docker build https://github.com/gwendal-orinel/docker.git#master:apache2 -t apache2
```

## Transmission
- Arm
```
docker build https://github.com/gwendal-orinel/docker.git#master:apache2 -t apache2
```

## Sickbeard
- Arm
```
docker build https://github.com/gwendal-orinel/docker.git#master:apache2 -t apache2
```

## Portainer
- Arm
```
docker run -d --name=ui  -p 9000:9000 -e PUID=0 -e PGID=0 -v /var/run/docker.sock:/var/run/docker.sock -v /var/portainer/data:/data portainer/portainer
```
