echo '
<VirtualHost *:80>
        DocumentRoot "/var/www/html"
        ProxyPass /.well-known/acme-challenge/ http://172.17.0.1:9080/.well-known/acme-challenge/
        ProxyPassReverse /.well-known/acme-challenge/ http://172.17.0.1:9080/.well-known/acme-challenge/
</VirtualHost>'
names=($name_ports) 
i=0
for http in $http_ports; do

if [ "${names[i]:1}" == "folio"  ]; then
echo '
<VirtualHost *:80> 
      ServerName "gwendal.orinel.net"
      ProxyPass / http://172.17.0.1:'$http'/
      ProxyPassReverse / http://172.17.0.1:'$http'/
      ProxyPreserveHost On
      ProxyPass /.well-known/acme-challenge/ http://172.17.0.1:9080/.well-known/acme-challenge/
      ProxyPassReverse /.well-known/acme-challenge/ http://172.17.0.1:9080/.well-known/acme-challenge/
</VirtualHost>'	
fi

if [ "${names[i]:1}" == "owncloud"  ]; then
echo '
<VirtualHost *:80> 
      ServerName "cloud.orinel.net"
      ProxyPass / http://172.17.0.1:'$http'/
      ProxyPassReverse / http://172.17.0.1:'$http'/
      ProxyPreserveHost On
      ProxyPass /.well-known/acme-challenge/ http://172.17.0.1:9080/.well-known/acme-challenge/
      ProxyPassReverse /.well-known/acme-challenge/ http://172.17.0.1:9080/.well-known/acme-challenge/
</VirtualHost>'	
fi
     
i=$((i+1))
done
