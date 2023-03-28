terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

resource "virtualbox_vm" "frontend" {
  count     = 1
  name      = "frontendterra"
  image     = "https://app.vagrantup.com/geerlingguy/boxes/ubuntu2004/versions/1.0.4/providers/virtualbox.box"
  cpus      = 2
  memory    = "1024 mib"

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet1"
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i 192.168.60.4 roles/frontend/main.yml"
  }
}

resource "virtualbox_vm" "backend" {
  count     = 1
  name      = "backendterra"
  image     = "https://app.vagrantup.com/geerlingguy/boxes/ubuntu2004/versions/1.0.4/providers/virtualbox.box"
  cpus      = 2
  memory    = "1024 mib"

  network_adapter {
    type           = "hostonly"
    host_interface = "vboxnet1"
  }
  provisioner "local-exec" {
    command = "ansible-playbook  -i 192.168.60.5  roles/backend/main.yml"
  }
}


