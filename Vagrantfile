# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", ip: "192.168.33.18"

  config.vm.synced_folder "~/Downloads", "/home/vagrant/Downloads"
  config.vm.synced_folder "~/PycharmProjects", "/home/vagrant/PycharmProjects"
  config.vm.synced_folder "~/WebstormProjects", "/home/vagrant/WebstormProjects"
  config.vm.synced_folder "~/Projects", "/home/vagrant/Projects"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    echo 'export WS_HOME=${HOME}/Projects/wshell' >> /home/vagrant/.bashrc
    echo 'export PATH=${WS_HOME}/bin:$PATH' >> /home/vagrant/.bashrc
    echo '. ${WS_HOME}/conf/system/bashrc' >> /home/vagrant/.bashrc
    # apt-get update
    # apt-get install -y apache2
  SHELL
end
