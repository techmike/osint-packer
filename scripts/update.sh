#!/bin/sh -eux

# Update cache
/usr/bin/apt-get update

#Update packages
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade

# Reboot after updates
reboot
