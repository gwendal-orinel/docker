#!/bin/bash -e
PROJECTID="12338658"

for domain in $(curl -s --header "PRIVATE-TOKEN: $TOKEN" https://gitlab.com/api/v4/projects/$PROJECTID/pages/domains | jq -r .[].domain);do

curl -s --request PUT --header "PRIVATE-TOKEN: $TOKEN" --form "certificate=@cert/archive/orinel.net/fullchain1.pem" --form "key=@cert/archive/orinel.net/privkey1.pem" https://gitlab.com/api/v4/projects/$PROJECTID/pages/domains/$domain

done
