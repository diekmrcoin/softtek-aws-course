#!/bin/bash
echo "<h1>GET: <span style='color:red' id='getParam'></span></h1>" | sudo tee -a /var/www/html/getParams.html
echo "<script>" | sudo tee -a /var/www/html/getParams.html
echo "const params = new URLSearchParams(window.location.search);" | sudo tee -a /var/www/html/getParams.html
echo "const param = params.get('p');" | sudo tee -a /var/www/html/getParams.html
echo "document.getElementById('getParam').innerHTML = param;" | sudo tee -a /var/www/html/getParams.html
echo "</script>" | sudo tee -a /var/www/html/getParams.html
