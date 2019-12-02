#!/bin/bash -e
PROJECTS=$(curl -s --header "PRIVATE-TOKEN: $TOKEN" https://gitlab.com/api/v4/users/gwendal-orinel/projects/ | jq .[].id)

LAST_CERT=$(ls cert/archive/orinel.net/fullchain*.pem | tail -1)
LAST_KEY=$(ls cert/archive/orinel.net/privkey*.pem | tail -1)

for PROJECT in $PROJECTS; do

    for DOMAIN in $(curl -s --header "PRIVATE-TOKEN: $TOKEN" https://gitlab.com/api/v4/projects/$PROJECT/pages/domains | jq -r .[].domain);do
    
        curl -s --request PUT --header "PRIVATE-TOKEN: $TOKEN" --form "certificate=@cert/archive/orinel.net/$LAST_CERT" --form "key=@cert/archive/orinel.net/$LAST_KEY" https://gitlab.com/api/v4/projects/$PROJECT/pages/domains/$DOMAIN
    
    done

done