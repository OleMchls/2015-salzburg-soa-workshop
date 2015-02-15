# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = '2015-salzburg-soa-workshop'
  config.vm.box_url  = 'https://dl.dropboxusercontent.com/u/18537549/2015-salzburg-soa-workshop.box'
  config.vm.hostname = 'soa-workshop-box'

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 9292, host: 9292
  config.vm.network :forwarded_port, guest: 4567, host: 4567
  config.vm.network :forwarded_port, guest: 4568, host: 4568
  config.vm.network :forwarded_port, guest: 4569, host: 4569
  config.vm.network :forwarded_port, guest: 4570, host: 4570
end
