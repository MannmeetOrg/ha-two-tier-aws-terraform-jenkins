#!/bin/bash
yum update -y
yum install -y httpd mysql
systemctl start httpd
systemctl enable httpd
echo "<h1>App deployed successfully</h1>" > /var/www/html/index.html
