# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu-12.04.2-amd64-fusion"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://grahamc.com/vagrant/ubuntu-12.04.2-server-amd64-vmware-fusion.box"

  # Configure ssh specific parameters
  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  # Provider specific configuration
  config.vm.provider :vmwaer_fusion do |vmFusion|
    vmFusion.gui = false
    vmFusion.vmx["memsize"] = "2048"
  end

  # Configure global chef server for provisioning
  config.vm.provision :chef_client do |chef|
    chef.chef_server_url = "https://api.opscode.com/organization/brella"
    chef.validation_key_path = "#{File.dirname(__FILE__)}/.chef/brella-validator.pem"
    chef.validation_client_name = "brella-validator"
  end

  # Configure individual machines
  conf.vm.define :rails do |rails|
    rails.vm.hostname = "rails"

    # Configure the node name
    rails.vm.provision :chef_client do |chef|
      chef.node_name = "rails"
    end

  end
end
