# RMIT University Vietnam
# Course: COSC2767 Systems Deployment and Operations
# Semester: 2023C
# Assessment: Assignment 2
# Author: Nguyen Kien Vu
# ID: 3878291
# Created  date: 26/12/2023
# Last modified: 26/12/2023
# Acknowledgement: This is the file created to handle the Maven Server Setup.

#!/bin/bash

# Install git
yum install git

# Install Apache Maven
cd /opt
wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
tar -zxvf apache-maven-3.9.6-bin.tar.gz
mv apache-maven-3.9.6 maven
rm -rf apache-maven-3.9.6-bin.tar.gz

# Update .bash_profile
cd ~
sed -i '/^PATH=\$PATH:\$HOME\/bin$/d' ~/.bash_profile
sed -i '/^export PATH$/d' ~/.bash_profile

# Add new elements to .bash_profile
sed -i -e '/#User specific environment and startup programs/,$d' -e '$a\
M2_HOME=/opt/maven\nM2=/opt/maven/bin\nJAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.20.0.8-1.amzn2.0.1.x86_64\n\n\
PATH=$PATH:$HOME/bin:$JAVA_HOME:$M2_HOME:$M2\n\n\
export PATH' ~/.bash_profile

# Source .bash_profile to apply changes
source ~/.bash_profile
echo $PATH

# Check if Maven is ready or not
mvn -v

# Completion message
echo "Maven is ready, Please configure Jenkins's Plugin."