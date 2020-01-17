# dust_sensor_task
Read values of sensor SDS011

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

How can you automate the script to be executed every 2nd hour with Jenkin:

Send your solution to d.sotirov@sap.com and borislav.arnaudov@sap.com


SOLUTION:
 1. Run "sensor.sh" script.
   
   - The script will copy all the necessary data from the last 5 minutes in two files. One for data and another for time.

   - Merge the penultimate time and data in one "txt" file.

   - Shows the result and delete all txt files to clean space. 


 2 Automate the script with Jenkins: 

 



Resources: 

 - https://airtube.info/index.php?pos=42.65850160702483,23.27708959579468,15&geohash=sx8d9rz9942&chart=on

 - https://data.sensor.community/airrohr/v1/filter/type=SDS011,country=BG 

 - https://github.com/opendata-stuttgart/meta/wiki/APIs

 and of course

 - https://stackoverflow.com/
