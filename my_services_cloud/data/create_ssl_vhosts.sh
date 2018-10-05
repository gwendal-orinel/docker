echo '
<IfModule mod_ssl.c>
<VirtualHost *:8080>
        DocumentRoot "/var/www/html" 
</VirtualHost>'
names=($name_ports) 
i=0
for https in $https_ports; do

if [ "${names[i]:1}" == "apache-php"  ]; then
echo '
<VirtualHost *:8080> 
      ServerName "gwendal.orinel.net"
      ProxyPass / https://172.17.0.1:'$https'/
      ProxyPassReverse / https://172.17.0.1:'$https'/
      ProxyPreserveHost On
</VirtualHost>'	
fi

if [ "${names[i]:1}" == "owncloud"  ]; then
echo '
<VirtualHost *:8080> 
      ServerName "cloud.orinel.net"
      ProxyPass / https://172.17.0.1:'$https'/
      ProxyPassReverse / https://172.17.0.1:'$https'/
      ProxyPreserveHost On
</VirtualHost>'	
fi
  
i=$((i+1))
done

echo '</IfModule>'
