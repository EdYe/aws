#!/bin/sh

# the user is root when running the EC2 user data
USER_HOME="/home/ec2-user"

# System update
sudo yum update -y

# Update .bash_profile
sudo aws s3 cp s3://cobalt-chc-dev-dataplatform/users/UPI_TAIWAN_OFFSHORE/edward/SCRIPTS_FOR_NEW_EC2/.bash_profile $USER_HOME/.bash_profile
# Update .vimrc
sudo aws s3 cp s3://cobalt-chc-dev-dataplatform/users/UPI_TAIWAN_OFFSHORE/edward/SCRIPTS_FOR_NEW_EC2/.vimrc $USER_HOME/.vimrc

# Setup X Window System
# Installation
sudo yum install  xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-apps libXtst -y

# Setup X Window System
# Update /etc/ssh/sshd_config
sudo aws s3 cp s3://cobalt-chc-dev-dataplatform/users/UPI_TAIWAN_OFFSHORE/edward/SCRIPTS_FOR_NEW_EC2/sshd_config /etc/ssh/sshd_config

# install git
sudo yum install git -y
git config --global credential.helper store

# install java
aws s3 cp s3://cobalt-chc-dev-dataplatform/users/UPI_TAIWAN_OFFSHORE/share/dev_software/jdk-8u221-linux-x64.rpm "$USER_HOME"/jdk-8u221-linux-x64.rpm
sudo yum localinstall $USER_HOME/jdk-8u221-linux-x64.rpm -y

# Update /etc/ssh/sshd_config
sudo service sshd restart
sudo reboot