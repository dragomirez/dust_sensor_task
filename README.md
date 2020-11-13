# dust_sensor_task
Read values of a dust sensor 10001:

A jq-1.5 is required. Before you run the script install jq with one of the following commands:  

For CentOs:

  sudo yum install jq -y 

For Ubuntu:

  sudo apt install jq -y
  
  
How to create sensor scrip in a few steps:

TASK:

Take one sensor(for example the nearest to SAP Labs Bulgaria)
  https://airtube.info/index.php?pos=42.65850160702483,23.27708959579468,15&geohash=sx8d9rz9942&chart=on

There is a link in the down left corner pointing to a page with the sensor data:
  https://airtube.info/sensor.php?id=5cd51f61a1d8cb490f089603

Use the ID of the SDS011 sensor (dust) and use it for the rest API documented here:
  https://github.com/opendata-stuttgart/meta/wiki/APIs

From the API find a way to read the data from the last 5 min from the sensor with the ID above

Goal — do not read last reading, but the one before it in a shell/python/(other) 
script that can be executed from Linux command line which should return in 
stdout the timestamp of the reading and the values for PM 10 and PM 2.5
dust particles 

