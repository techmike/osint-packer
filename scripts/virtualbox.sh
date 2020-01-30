#!/usr/bin/env bash

# Update cache
/usr/bin/apt-get update

DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y install build-essential debconf-utils dkms build-essential linux-image-`uname -r`

mount VBox*.iso -o loop /mnt/ ||echo "No VBoxGuestAdditions.iso"
cd /mnt
/bin/bash VBoxLinuxAdditions.run --nox11 || echo "No VM tools installed"
cd /
umount /mnt || echo "Nothing mounted"
apt clean
