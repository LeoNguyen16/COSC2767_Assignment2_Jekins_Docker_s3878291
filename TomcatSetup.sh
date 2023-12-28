# RMIT University Vietnam
# Course: COSC2767 Systems Deployment and Operations
# Semester: 2023C
# Assessment: Assignment 2
# Author: Nguyen Kien Vu
# ID: 3878291
# Created  date: 26/12/2023
# Last modified: 26/12/2023
# Acknowledgement: This is the file created to handle the Tomcat Server Setup.

#!/bin/bash

# Install Java 11
sudo amazon-linux-extras install java-openjdk11

# Install Apache Tomcat
cd /opt
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.83/bin/apache-tomcat-9.0.83.tar.gz
tar -zxvf apache-tomcat-9.0.83.tar.gz
mv apache-tomcat-9.0.83 tomcat
rm -rf apache-tomcat-9.0.83.tar.gz

# Configure Tomcat
cd tomcat/bin

# Configure host-manager context.xml
sed -i '/<Valve className="org.apache.catalina.valves.RemoteAddrValve"/ s/^/<!--/' /opt/tomcat/webapps/host-manager/META-INF/context.xml
sed -i '/allow="127\\\.\\d+\\\.\\d+\\\.\\d+\|::1\|0:0:0:0:0:0:0:1" \/>/ s/$/-->/' /opt/tomcat/webapps/host-manager/META-INF/context.xml

# Configure manager context.xml
sed -i '/<Valve className="org.apache.catalina.valves.RemoteAddrValve"/ s/^/<!--/' /opt/tomcat/webapps/manager/META-INF/context.xml
sed -i '/allow="127\\\.\\d+\\\.\\d+\\\.\\d+\|::1\|0:0:0:0:0:0:0:1" \/>/ s/$/-->/' /opt/tomcat/webapps/manager/META-INF/context.xml
./startup.sh

# Configure Tomcat Users
sudo sed -i '/<\/tomcat-users>/i \
<role rolename="admin-gui"/> \
<role rolename="manager-gui"/> \
<role rolename="manager-script"/> \
<role rolename="manager-jmx"/> \
<role rolename="manager-status"/> \
<user username="admin" password="s3cret" roles="admin-gui,manager-gui,manager-script,manager-jmx,manager-status"/>' /opt/tomcat/conf/tomcat-users.xml

./shutdown.sh
./startup.sh

# Completion message
echo "Tomcat is ready, Please Install the Webpage."