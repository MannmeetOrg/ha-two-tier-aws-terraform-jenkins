#!/bin/bash
sudo yum update -y
sudo yum install -y java-11-openjdk
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install -y jenkins git unzip
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo yum install -y docker
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker jenkins
sudo curl -O https://releases.hashicorp.com/terraform/1.6.2/terraform_1.6.2_linux_amd64.zip
sudo unzip terraform_1.6.2_linux_amd64.zip -d /usr/local/bin
sudo yum install -y python3-pip
pip3 install awscli --upgrade
