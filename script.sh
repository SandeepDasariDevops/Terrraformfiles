#!/bin/bash
yum update -y
yum install httpd* -y
systemctl start httpd
systemctl enable httpd
echo "Hello Sandeep" > /var/www/html/index.html
