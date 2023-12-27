#! /bin/bash
#Downloading jenkins repo
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

#Importing jenkins key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

#Installing epel
sudo amazon-linux-extras install epel

#Installing java-openjdk11
sudo amazon-linux-extras install java-openjdk11

#Installing jenkins
sudo yum install -y jenkins


echo "Setup SSH key"
mkdir /var/lib/jenkins/.ssh
touch /var/lib/jenkins/.ssh/known_hosts
sudo chown -R jenkins:jenkins /var/lib/jenkins/.ssh
sudo chmod 700 /var/lib/jenkins/.ssh
sudo mv /tmp/id_rsa /var/lib/jenkins/.ssh/id_rsa
sudo chmod 600 /var/lib/jenkins/.ssh/id_rsa
sudo chown -R jenkins:jenkins /var/lib/jenkins/.ssh/id_rsa

echo "Configure Jenkins"
mkdir -p /var/lib/jenkins/init.groovy.d
mv /tmp/scripts/*.groovy /var/lib/jenkins/init.groovy.d/
sudo chown -R jenkins:jenkins /var/lib/jenkins/init.groovy.d
mv /tmp/config/jenkins /etc/sysconfig/jenkins
sudo chmod +x /tmp/config/install-plugins.sh
echo "install plugins"
cd /tmp/config/
ls
sudo ./install-plugins.sh
cd /home/ec2-user
#Starting jenkins service
sudo service jenkins start

#Enable jenkins service to start at system boot time
sudo chkconfig jenkins on

#Installing git
sudo yum install -y git

#Installing docker
sudo yum install -y docker

#Starting docker service
sudo service docker start

#Adding jenkins user to docker group and leaving jenkins user to its supplementary group it was already member of
sudo usermod -aG docker jenkins
sudo usermod -aG docker ec2-user

#Providing full access to docker.sock file
sudo chmod 777 /var/run/docker.sock

#Restarting docker service
sudo service docker restart
