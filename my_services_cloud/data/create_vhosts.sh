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
      Redirect / https://gwendal.orinel.net/
</VirtualHost>'	
fi

if [ "${names[i]:1}" == "nextcloud"  ]; then
echo '
<VirtualHost *:80> 
      ServerName "cloud.orinel.net"
      Redirect / https://cloud.orinel.net/
</VirtualHost>'	
fi
     
i=$((i+1))
done
