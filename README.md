## IP 4 Orchestration

## Step 1: Kubernetes controllers
- Create backend deployment and service yaml files
    - excecute kubectl apply -f backend_deployment.yaml backend_service.yaml  
- Create backend ingress yaml files
    The backend ingress should map to backend service name and port
    - excecute kubectl apply -f backend_ingress.yaml
-Create frontend app deployment and service yaml files
    - exceute - excecute kubectl apply -f frontend_deployment.yaml frontend_service.yaml 
- Create statefulset and service yaml files
    - excecute kubectl apply -f stateful_database.yaml mongo_svc.yaml
    - updated backend deployment container to use statefulset connection string

## Step 2: Update docker images
- Update backend
    - dockerfile with ENV CI=true to fix Crashloopbackoff error during deployment
    - update client code to read from the statefullset env varible for the connnection string
- Update client code
    - Create nginx.config file and apply upstream to dynamically resolve the backend service ip
    - Update client controller to point to '/api/*' 
    - Update client dockerfile
        - add  ENV CI=true to fix Crashloopbackoff error during deployment
        - add npm build to create build files
        - add nginx:alpine image and copy the client build files to nginx html folder
        - replace default nginx config with the custom nginx.config file created
        - set nginx as default entrypoint
- build both client and backend images and push to dockerhub

## Step 3: Update Kubernetes controllers with docker images
- update both backend and frontend deployments and apply changes




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
    - playbook.yml provides ansible configurations and uses roles.
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