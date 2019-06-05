#!/bin/bash -e
PROJECTID="12338658"

for domain in $(curl -s --header "PRIVATE-TOKEN: $TOKEN" https://gitlab.com/api/v4/projects/$PROJECTID/pages/domains | jq -r .[].domain);do

curl --request PUT --header "PRIVATE-TOKEN: $TOKEN" --form "certificate=@certs/fullchain1.pem" --form "key=@certs/privkey1.pem" https://gitlab.com/api/v4/projects/$PROJECTID/pages/domains/$domain

done
