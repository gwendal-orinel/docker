#!/bin/bash -e
PROJECTS=$(curl -s --header "PRIVATE-TOKEN: $TOKEN" https://gitlab.com/api/v4/users/gwendal-orinel/projects/ | jq .[].id)

for PROJECT in $PROJECTS; do

    for DOMAIN in $(curl -s --header "PRIVATE-TOKEN: $TOKEN" https://gitlab.com/api/v4/projects/$PROJECT/pages/domains | jq -r .[].domain);do
    
        curl -s --request PUT --header "PRIVATE-TOKEN: $TOKEN" --form "certificate=@cert/archive/orinel.net/fullchain1.pem" --form "key=@cert/archive/orinel.net/privkey1.pem" https://gitlab.com/api/v4/projects/$PROJECT/pages/domains/$DOMAIN
    
    done

done