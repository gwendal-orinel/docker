echo "\
<html>\
<h1>Http services:</h1>"

names=($name_ports)
i=0
for http in $http_ports; do
        echo ${names[i]:1}": <a target='_blank' href='http://cloudwatt.orinel.net:"$http"'>http://cloudwatt.orinel.net:"$http"</a></br>"
        i=$((i+1)) 
done

echo "\
<h1>Https services:</h1>"
i=0
for https in $https_ports; do
        echo ${names[i]:1}": <a target='_blank' href='https://cloudwatt.orinel.net:"$https"'>https://cloudwatt.orinel.net:"$https"</a></br>"
        i=$((i+1))
done

echo "</html>"
