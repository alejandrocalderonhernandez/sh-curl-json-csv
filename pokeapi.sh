#!/bin/bash
response=$(curl -s 'https://pokeapi.co/api/v2/type/ground')
echo $response | jq '.pokemon | .[] | select(.slot == 2) | .pokemon ' > pokemon.json
echo | jq -r '(to_entries | map(.value))|@csv' pokemon.json > pokemon.csv
sed -i '1i Name,Url' pokemon.csv
sed -i 's/\"//g' pokemon.csv

# you need install -> sudo apt-get install jq
# Alejandro Calderon