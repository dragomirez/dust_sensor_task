#!/bin/bash

curl -s https://data.sensor.community/airrohr/v1/sensor/10001/ | jq -s > data.json

cat data.json | grep 'value\|value_type' | tail -n4
