#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hello World Sofftek!</h1><h2>Machine 01 listening</h2>" | sudo tee /var/www/html/index.html
