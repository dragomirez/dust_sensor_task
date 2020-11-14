#!/bin/bash

curl -s https://data.sensor.community/airrohr/v1/sensor/10001/ | jq -s | grep 'value\|value_type' | tail -n4
