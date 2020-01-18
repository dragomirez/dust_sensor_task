#!/bin/bash

## To transfer data we will use curl command
curl https://data.sensor.community/static/v2/data.dust.min.json > dust

## This one will copy the penultimate values in "txt" file
sed -E 's/\},\s*\{/\},\n\{/g' dust | grep -m2 'id":10001' -A3 | tail -n2 > sap_sensor

## WIth the next two we will copy time and sensor values in "result" file
cat sap_sensor|jq '.timestamp' > result 2> /dev/null

cat sap_sensor|jq '.sensordatavalues' >> result 2> /dev/null

## Let's clean all curly braces
sed -n -e 1p -e 4,6p -e 9,11p result > final

## This two will show the final result
echo "DATE, TIME AND DUST VALUES OF SENSOR 10001: "
cat final

## And now let's clean all the mess we created 
rm -rf dust sap_sensor result final
