#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd

# Hello world page
echo "<h1>Hello World Sofftek!</h1><h2>Machine 02 listening</h2>" | sudo tee /var/www/html/index.html

# Page printing the parameters
echo "<h1>GET: <span style='color:red' id='getParam'></span></h1>" | sudo tee -a /var/www/html/getParams.html
echo "<script>" | sudo tee -a /var/www/html/getParams.html
echo "const params = new URLSearchParams(window.location.search);" | sudo tee -a /var/www/html/getParams.html
echo "const param = params.get('p');" | sudo tee -a /var/www/html/getParams.html
echo "document.getElementById('getParam').innerHTML = param;" | sudo tee -a /var/www/html/getParams.html
echo "</script>" | sudo tee -a /var/www/html/getParams.html
