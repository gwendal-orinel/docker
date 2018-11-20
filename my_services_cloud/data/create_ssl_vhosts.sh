echo '<IfModule mod_ssl.c>'
names=($name_ports) 

### https backends
i=0
for https in $https_ports; do

if [ "${names[i]:1}" == "folio"  ]; then
echo '
<VirtualHost *:443> 
      ServerName "gwendal.orinel.net"
      ProxyPass / https://172.17.0.1:'$https'/
      ProxyPassReverse / https://172.17.0.1:'$https'/
      SSLProxyEngine on
      SSLProxyVerify none
      SSLProxyCheckPeerCN off
      Include /etc/apache2/options-ssl-apache.conf
      SSLCertificateFile /var/certbot/live/gwendal.orinel.net/fullchain.pem
      SSLCertificateKeyFile /var/certbot/live/gwendal.orinel.net/privkey.pem
</VirtualHost>'	
fi

if [ "${names[i]:1}" == "nextcloud"  ]; then
echo '
<VirtualHost *:443> 
      ServerName "cloud.orinel.net"
      ProxyPass / https://172.17.0.1:'$https'/
      ProxyPassReverse / https://172.17.0.1:'$https'/
      SSLProxyEngine on
      SSLProxyVerify none 
      SSLProxyCheckPeerCN off
      Include /etc/apache2/options-ssl-apache.conf
      SSLCertificateFile /var/certbot/live/cloud.orinel.net/fullchain.pem
      SSLCertificateKeyFile /var/certbot/live/cloud.orinel.net/privkey.pem
</VirtualHost>'	
fi


if [ "${names[i]:1}" == "webhook"  ]; then
echo '
<VirtualHost *:443> 
      ServerName "api.orinel.net"
      ProxyPass / https://172.17.0.1:'$https'/
      ProxyPassReverse / https://172.17.0.1:'$https'/
      SSLProxyEngine on
      SSLProxyVerify none 
      SSLProxyCheckPeerCN off
      Include /etc/apache2/options-ssl-apache.conf
      SSLCertificateFile /var/certbot/live/api.orinel.net/fullchain.pem
      SSLCertificateKeyFile /var/certbot/live/api.orinel.net/privkey.pem
</VirtualHost>'	
fi


if [ "${names[i]:1}" == "ctf"  ]; then
echo '
<VirtualHost *:443> 
      ServerName "ctf.orinel.net"
      ProxyPass / https://172.17.0.1:'$https'/
      ProxyPassReverse / https://172.17.0.1:'$https'/
      SSLProxyEngine on
      SSLProxyVerify none 
      SSLProxyCheckPeerCN off
      Include /etc/apache2/options-ssl-apache.conf
      SSLCertificateFile /var/certbot/live/ctf.orinel.net/fullchain.pem
      SSLCertificateKeyFile /var/certbot/live/ctf.orinel.net/privkey.pem
</VirtualHost>'	
fi

i=$((i+1))
done 

### http backends
i=0
for http in $http_ports; do

  
i=$((i+1))
done 

echo '</IfModule>'
