#!/usr/bin/zsh
ssh-keygen -t rsa -b 4096 -m pem -f aws-intro.pem
ssh-keygen -y -f aws-intro.pem > aws-intro.pem.pub
