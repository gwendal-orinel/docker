#!/bin/bash
PROJECTID="12338658"

for domain in $(curl -s --header "PRIVATE-TOKEN: $TOKEN" https://gitlab.com/api/v4/projects/$PROJECTID/pages/domains | jq -r .[].domain);do

curl --request PUT --header "PRIVATE-TOKEN: $TOKEN" --form "certificate=@live/orinel.net/cert.pem" --form "key=@live/orinel.net/privkey.pem" https://gitlab.com/api/v4/projects/$PROJECTID/pages/domains/$domain

done
