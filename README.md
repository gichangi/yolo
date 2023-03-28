## IP 3 Configuration Management 
# Requirements
Install virtual box


## Vagrant configuration
- [root folder] : vagrant init geerlingguy/ubuntu2004
- update Vagrantfile configuration 
    config.vm.provider "virtualbox" do |vb|
        vb.gui = true
        vb.memory = "1024"
        vb.cpus = 2
    end
    # Frontent Application server
    config.vm.define "frontend" do |app|
        app.vm.hostname = "frontend"
        app.vm.network :private_network, ip: "192.168.60.4"
    end
    # Backend Application server
    config.vm.define "backend" do |app|
        app.vm.hostname = "backend"
        app.vm.network :private_network, ip: "192.168.60.5"
    end

    # Ansible provisioner.
    config.vm.provision :ansible do |ansible|
        ansible.playbook = "playbook.yml"
    end  
## Ansible configuration
- [root folder] : create playbook.yml and hosts
    - playbook.yml provides 
    - host file provides list of hosts and ips assigned. Example below
        [frontend]
        frontendserver ansible_host=192.168.60.4 ansible_port=2222 ansible_user=vagrant ansible_private_key_file=.vagrant/machines/default/virtualbox/private_key

        [backend]
        backendserver ansible_host=192.168.60.5 ansible_port=2222 ansible_user=vagrant ansible_private_key_file=.vagrant/machines/default/virtualbox/private_key
    - create roles folder for the different roles declared on your playbook.yml













## IP2 NOTES 
# Requirements
Make sure that you have the following installed:
- [node](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04) 
- npm 
- [MongoDB](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/) and start the mongodb service with `sudo service mongod start`

## Navigate to the Client Folder 
 `cd client`

## Run the folllowing command to install the dependencies 
 `npm install`

## Run the folllowing to start the app
 `npm start`

## Open a new terminal and run the same commands in the backend folder
 `cd ../backend`

 `npm install`

 `npm start`

 ### Go ahead a nd add a product (note that the price field only takes a numeric input)