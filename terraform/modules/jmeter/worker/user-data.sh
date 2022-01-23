#!/bin/sh

# the user is root when running the EC2 user data
USER_HOME="/home/ec2-user"

# System update
sudo yum update -y:

# Setup Java
aws s3 cp s3://cobalt-chc-dev-dataplatform/users/UPI_TAIWAN_OFFSHORE/share/dev_software/jdk-11.0.11_linux-x64_bin.rpm "$USER_HOME"/jdk-11.0.11_linux-x64_bin.rpm
sudo yum localinstall "$USER_HOME"/jdk-11.0.11_linux-x64_bin.rpm -y
echo "export JAVA_HOME=/usr/java/jdk-11.0.11" >> "$USER_HOME"/.bash_profile

# Setup JMeter
aws s3 cp s3://cobalt-chc-dev-dataplatform/users/UPI_TAIWAN_OFFSHORE/share/dev_software/apache-jmeter-5.4.1.zip "$USER_HOME"/apache-jmeter-5.4.1.zip
unzip "$USER_HOME"/apache-jmeter-5.4.1.zip -d "$USER_HOME"

# set the heap size to improve performance
aws s3 cp s3://cobalt-chc-dev-dataplatform/users/UPI_TAIWAN_OFFSHORE/share/dev_software/config/jmeter/setenv.sh "$USER_HOME"/apache-jmeter-5.4.1/bin/setenv.sh
# turn off the SSL of JMeter server
sed -i 's/#server.rmi.ssl.disable=false/server.rmi.ssl.disable=true/g' "$USER_HOME"/apache-jmeter-5.4.1/bin/jmeter.properties

###################################
# Following is only for worker
###################################
echo "${USER_HOME}/apache-jmeter-5.4.1/bin/jmeter-server &" >> "$USER_HOME"/.bash_profile