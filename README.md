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

How can you automate the script to be executed every 2nd hour with Jenkins:

Send your solution to d.sotirov@sap.com and borislav.arnaudov@sap.com


SOLUTION:
 1. Run "sensor.sh" script.
   
   - The script will copy all the necessary data from the last 5 minutes in two files. One for data and another for time.

   - Merge the penultimate time and data in one "txt" file.

   - Shows the result and delete all txt files to clean space. 


 2 Automate the script with Jenkins: 

  - Go to Jenkins and create a new project ("Github Integration Plugin" is required. So, go to "Manage Jenkins/Manage Plugins/Available". In search bar write "Github Integration Plugin" and download it. Don't forget to check "Restart Jenkins when the installation is complete").

   - Give a name to your project and click on the "Freestyle project". Copy your GitHub project URL and paste it in "Github project/ Project url".

   - Go to "Source Code Management and" and add a repository URL. 

   - Then go to "Build Triggers" and check "Build periodically". In the question mark, you can find the syntax of cron. We want to make Jenkins execute the script on every two hours. Sp we will do: "H H/2 * * *".   
   
   - Next, check on "GitHub hook trigger for GITScm polling". Then go back to GitHub repository settings and open "Webhooks/Add webhook". In "Payload URL" add your Jenkins URL and "/github-webhook/"like in this example: "http//jenkins-host:8080//github-webhook/" and click "save". 



Resources: 

 - https://airtube.info/index.php?pos=42.65850160702483,23.27708959579468,15&geohash=sx8d9rz9942&chart=on

 - https://data.sensor.community/airrohr/v1/filter/type=SDS011,country=BG 

 - https://github.com/opendata-stuttgart/meta/wiki/APIs

 and of course

 - https://stackoverflow.com/
