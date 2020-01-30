# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# Refer to this document for info

Vagrant.configure("2") do |config|
  config.ssh.username = "ctfadmin"
  config.ssh.password = "ctfadmin"

  # Luks encrypted virtual machine
  config.vm.define "osintdesktopenc" do |osintdesktopenc|
    osintdesktopenc.vm.box = "osintdesktopenc"
    osintdesktopenc.vm.hostname = 'osintdesktopenc'
    osintdesktopenc.vm.box_url = "file://builds/virtualbox-encrypted-desktop-standard-debian10.box"
    osintdesktopenc.vm.synced_folder "ansible","/ansible"

    osintdesktopenc.vm.provider "virtualbox" do |v|
      v.gui = true
      v.customize ["modifyvm", :id, "--memory", "8192"]
      v.customize ["modifyvm", :id, "--cpus", "4"]
      v.customize ["modifyvm", :id, "--vram", "128"]
      v.customize ["modifyvm", :id, "--monitorcount", "2"]
      v.customize ["modifyvm", :id, '--audio', 'pulse', '--audiocontroller', 'hda', '--audioout', 'on']
      v.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
      v.customize ["modifyvm", :id, "--nictype1", "virtio"]
      v.customize ["modifyvm", :id, "--paravirtprovider", "default"]
    end

    osintdesktopenc.vm.provision :ansible_local do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "/ansible/osint-desktop.yml"
        ansible.verbose        = true
        ansible.install        = true
        ansible.limit          = "osintdesktopenc" # or only "nodes" group, etc.

    end
  end
  
  # unencrypted virtual machine
  config.vm.define "osintdesktop" do |osintdesktop|
    osintdesktop.vm.box = "osintdesktop"
    osintdesktop.vm.hostname = 'osintdesktop'
    osintdesktop.vm.box_url = "file://builds/virtualbox-regular-desktop-standard-debian10.box"
    osintdesktop.vm.synced_folder "ansible","/ansible"

    osintdesktop.vm.provider "virtualbox" do |v|
      v.gui = true
      v.customize ["modifyvm", :id, "--memory", "8192"]
      v.customize ["modifyvm", :id, "--cpus", "4"]
      v.customize ["modifyvm", :id, "--vram", "128"]
      v.customize ["modifyvm", :id, "--monitorcount", "2"]
      v.customize ["modifyvm", :id, '--audio', 'pulse', '--audiocontroller', 'hda', '--audioout', 'on']
      v.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
      v.customize ["modifyvm", :id, "--nictype1", "virtio"]
      v.customize ["modifyvm", :id, "--paravirtprovider", "default"]
    end

    osintdesktop.vm.provision :ansible_local do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "/ansible/osint-desktop.yml"
        ansible.verbose        = true
        ansible.install        = true
        ansible.limit          = "osintdesktop" # or only "nodes" group, etc.

    end
  end
end
