#!/bin/bash

#check for which 
os=$(lsb_release -d | awk '{print $2}')

#if statement for 
if [[ "$os" != "Ubuntu" ]]; then
    echo "this script has only been tested on an Ubuntu 20.04 system"

#update system 
sudo apt update -y 


#install java
sudo apt install openjdk-11-jdk -y

#check and add jenkins to repo list
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'


#update system to pull repo 
sudo apt update -y 

#install jenkins using apt package management
sudo apt install jenkins -y


#enable jenkins to start when system starts
sudo systemctl enable jenkins





