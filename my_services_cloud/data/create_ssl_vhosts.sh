echo '
<IfModule mod_ssl.c>
<VirtualHost *:8080>
        DocumentRoot "/var/www/html"
</VirtualHost>'
names=($name_ports) 
i=0
for http in $http_ports; do

if [ "${names[i]:1}" == "folio"  ]; then
echo '
<VirtualHost *:8080> 
      ServerName "gwendal.orinel.net"
      ProxyPass / https://172.17.0.1:'$http'/
      ProxyPassReverse / https://172.17.0.1:'$http'/
      ProxyPreserveHost On
</VirtualHost>'	
fi

if [ "${names[i]:1}" == "owncloud"  ]; then
echo '
<VirtualHost *:8080> 
      ServerName "cloud.orinel.net"
      ProxyPass / http://172.17.0.1:'$http'/
      ProxyPassReverse / http://172.17.0.1:'$http'/
      ProxyPreserveHost On
</VirtualHost>'	
fi
  
echo '</IfModule>'
i=$((i+1))
done
