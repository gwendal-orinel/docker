echo '
<VirtualHost *:80>
        DocumentRoot "/www/html"
</VirtualHost>'
names=($name_ports)
i=0
for http in $http_ports; do

if [ "${name[i]:1}" == "folio"  ]; then
echo '
<VirtualHost *:80> 
      ServerName "gwendal.orinel.net"
      ProxyPass / http://localhost:'$http'/
      ProxyPassReverse / http://localhost:'$http'/
      ProxyPreserveHost On
</VirtualHost>'	
fi

if [ "${name[i]:1}" == "owncloud"  ]; then
echo '
<VirtualHost *:80> 
      ServerName "cloud.orinel.net"
      ProxyPass / http://localhost:'$http'/
      ProxyPassReverse / http://localhost:'$http'/
      ProxyPreserveHost On
</VirtualHost>'	
fi
     
i=$((i+1))
done
