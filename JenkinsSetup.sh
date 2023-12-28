# RMIT University Vietnam
# Course: COSC2767 Systems Deployment and Operations
# Semester: 2023C
# Assessment: Assignment 2
# Author: Nguyen Kien Vu
# ID: 3878291
# Created  date: 26/12/2023
# Last modified: 26/12/2023
# Acknowledgement: This is the file created to handle the Jenkins Server Setup.

#!/bin/bash

# Prepare Jenkins Environment
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install Java11
sudo amazon-linux-extras install java-openjdk11

# Install Jenkins
yum install jenkins
service jenkins start
service jenkins status

# Get Jenkins Password
cat /var/lib/jenkins/secrets/initialAdminPassword

# Completion message
echo "Please use the Jenkins's password to access its webpage."