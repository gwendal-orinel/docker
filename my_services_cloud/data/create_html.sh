echo "\
<html>\
<h1>Http services:</h1>\
<?php $host=$_SERVER['SERVER_NAME']; ?>"

names=($name_ports)
i=0
for http in $http_ports; do
        echo ${names[i]:1}": <a target='_blank' href='http://<?php echo $host ?>:"$http"'>http://<?php echo $host ?>:"$http"</a></br>"
        i=$((i+1)) 
done

echo "\
<h1>Https services:</h1>"
i=0
for https in $https_ports; do
        echo ${names[i]:1}": <a target='_blank' href='https://<?php echo $host ?>:"$https"'>https://<?php echo $host ?>:"$https"</a></br>"
        i=$((i+1))
done

echo "</html>"
