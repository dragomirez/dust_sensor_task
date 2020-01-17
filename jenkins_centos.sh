#!/bib/bash

## Jenkins is a Java application, so the first step is to install Java. 
##If you have multiple versions of Java installed on your machine make sure Java 8 is the default Java version.

sudo yum install java-1.8.0-openjdk-devel -y

curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo

sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

## In order to help Java-based applications locate the Java virtual machine properly, you need to set two environment variables: "JAVA_HOME" and "JRE_HOME".

sudo cp /etc/profile /etc/profile_backup
echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' | sudo tee -a /etc/profile
echo 'export JRE_HOME=/usr/lib/jvm/jre' | sudo tee -a /etc/profile
source /etc/profile

## Print the item for review:
echo $JAVA_HOME
echo $JRE_HOME

## To install Jenkins use official YUM repo
cd ~ 
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install jenkins -y

## Start the Jenkins service and set it to run at boot time:
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service

## Allow inbound traffic on port 8080
sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
sudo firewall-cmd --reload

