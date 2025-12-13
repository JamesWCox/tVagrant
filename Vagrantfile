# -*- mode: ruby -*-
# vi: set ft=ruby :
# https://devopscube.com/vagrant-tutorial-beginners/
# https://devopscube.com/how-to-setup-gui-for-amazon-ec2-rhel-7-instance/ 
# https://github.com/hashicorp/vagrant-vmware-desktop/blob/main/Vagrantfile
# https://technology.amis.nl/tech/installing-ubuntu-desktop-22-04-lts-visual-studio-code-and-node-js-on-a-virtual-machine-using-vagrant-and-oracle-virtualbox/
# https://github.com/jeffskinnerbox/ubuntu-desktop
# https://learn.microsoft.com/en-us/sharepoint/use-group-policy#exclude-specific-kinds-of-files-from-being-uploaded

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box      = "generic/ubuntu2204"
  config.vm.define     "jwc"
  config.vm.hostname = "JWC"

  # X forwarding support, using port 2222
  #config.ssh.forward_agent = true        # if true, agent forwarding over SSH connections is enabled
  #config.ssh.forward_x11   = true        # if true, X11 forwarding over SSH connections is enabled
  
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # Shared folder guest path must be absolute 
  config.vm.synced_folder "c:/users/jwc/data_share", "/home/vagrant/data_share"
  #config.vm.synced_folder "c:/users/jwc/.ssh", "/home/vagrant/.ssh"
  
  #config.vm.provision :shell do |s|
  #  s.path = 'vagrant/provision.sh'
  #end
  #config.vm.provision :shell, privileged: false, inline: "./home/vagrant/provision.sh"

  # Disable the default share of the current code directory. Doing this
  # provides improved isolation between the vagrant box and your host
  # by making sure your Vagrantfile isn't accessible to the vagrant box.
  # If you use this you may want to enable additional shared subfolders as
  # shown above.
  # config.vm.synced_folder ".", "/vagrant", disabled: true
  
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true # Display the VirtualBox GUI when booting the machine
    # https://askubuntu.com/a/1512372
	  vb.cpus = "2"
    vb.memory = "8192" # Customize the amount of memory on the VM
	
	# clipboard, drag & drop, notifications support
	vb.customize [ "modifyvm", :id, "--clipboard",          "bidirectional" ] # clipboard shared between host / guest
	vb.customize [ "modifyvm", :id, "--draganddrop",        "bidirectional" ] # drag & drop between host / guest
	# Seems to be problematic 
	#vb.customize [ "modifyvm", :id, "--accelerate3d",       "on"            ]
	vb.customize [ "modifyvm", :id, "--graphicscontroller", "vmsvga"        ]
	vb.customize [ "modifyvm", :id, "--vram",               "16"            ]
	
  end

  #$script = "sudo apt-get update"
  #config.vm.provision :shell, privileged: false, inline: $script
  config.vm.provision :shell, privileged: false, inline: "sudo apt update"
  config.vm.provision :shell, privileged: false, inline: "sudo apt upgrade -y"
  config.vm.provision :shell, privileged: false, inline: "sudo apt-get install -y make"
  config.vm.provision :shell, privileged: false, inline: "sudo apt-get install -y xauth"
  config.vm.provision :shell, privileged: false, inline: "sudo apt-get install -y vim"
  config.vm.provision :shell, privileged: false, inline: "sudo apt-get install -y git"
  config.vm.provision :shell, privileged: false, inline: "sudo apt install -y ubuntu-desktop"
  config.vm.provision :shell, privileged: false, inline: "sudo apt-get install -y cowsay"
  config.vm.provision :shell, privileged: false, inline: "gsettings set org.gnome.desktop.lockdown disable-lock-screen 'true'"
  
  ## Setup git information 
  #config.vm.provision :shell, privileged: false, inline: "git config credential.helper store"
  #config.vm.provision :shell, privileged: false, inline: "git config --global user.name 'jwc'"
  #config.vm.provision :shell, privileged: false, inline: "git config --global user.email 'jameswcox1@outlook.com'"
  ##config.vm.provision "shell", inline: <<-SHELL
  ##  git config --global user.name "jwc"
  ##  git config --global user.email "jameswcox1@outlook.com"
  ##SHELL
  
end