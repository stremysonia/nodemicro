#! /bin/bash

#Update the Amazon Linux 2 packages.

sudo yum update

#Install HAProxy.

sudo yum install haproxy

#check the default haproxy configuration

cat /etc/haproxy/haproxy.cfg > haproxyconf.txt

#To verify version, run:
haproxy >> haproxyconf.txt

exit 0