#!/usr/bin/env bash

sleep 30
# Update cache
/usr/bin/apt-get update
echo "Installing dependencies"
DEBIAN_FRONTEND=noninteractive apt-get install -y python3-pexpect python3-pip python3-apt

echo "Install Ansible"
/usr/bin/pip3 install ansible