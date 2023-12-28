# RMIT University Vietnam
# Course: COSC2767 Systems Deployment and Operations
# Semester: 2023C
# Assessment: Assignment 2
# Author: Nguyen Kien Vu
# ID: 3878291
# Created  date: 27/12/2023
# Last modified: 27/12/2023
# Acknowledgement: This is the file created to handle the Docker Server Setup.

#!/bin/bash

#Install docker
yum install docker -y
service docker start

# Pull Tomcat to Docker Instance
docker pull tomcat

#create a new dockeradmin user with username and password
useradd dockeradmin
passwd dockeradmin

#Add useradmin to docker group
usermod -aG docker dockeradmin

#Enable Password Authentication (inside the nano, Press Ctrl + W and type in "password" to 
#       find that line quicker and edit the PasswordAuthentication from no to yes)
nano /etc/ssh/sshd_config

#Restart SSH service to apply the new changes
service sshd reload

#Create Dockerfile to use for other purposes
nano Dockerfile

FROM tomcat:latest
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
COPY ./*.war /usr/local/tomcat/webapps

#Build Docker image from Dockerfile
docker build -t s3878291-tomcat .

#Create Container based on the earlier created Docker image
docker run -d --name s3878291-tomcat-v2 -p 8081:8080 s3878291-tomcat