#!/bin/bash
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo sed -i "/^[^#]*PubkeyAuthentication[[:space:]]no/c\PubkeyAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart