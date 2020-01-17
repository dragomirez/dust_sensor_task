#!/bin/bash

## To recieve data :
curl -X GET https://data.sensor.community/airrohr/v1/filter/type=SDS011,country=BG | jq -r '.[].sensordatavalues' > sensordata.txt

## To recieve time:
curl -X GET https://data.sensor.community/airrohr/v1/filter/type=SDS011,country=BG | jq -r '.[].timestamp' > time.txt

## This one will copy the penultimate time in "txt" file
cat time.txt | sed -n 2p > second.txt

## The following two will take penultimate values and combine them with time
cat sensordata.txt | grep -m2 "P1" -B3 | tail -n2 > dust.txt

cat sensordata.txt | grep -m2 "P2" -B3 | tail -n2 >> dust.txt

cat second.txt dust.txt > smoke.txt

echo
echo "The values are: "
echo

## This one will show the final result
cat smoke.txt

## And now let's clean all the mess we created 
rm -rf sensordata.txt time.txt second.txt dust.txt smoke.txt


