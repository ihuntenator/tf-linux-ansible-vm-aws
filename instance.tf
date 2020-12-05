resource "aws_instance" "ansible" {
  ami             = lookup(var.amis, var.region) 
  subnet_id       = var.subnet 
  security_groups = var.securityGroups 
  key_name        = var.keyName 
  instance_type   = var.instanceType 
  
  tags = {
    Name = var.instanceName
  }

  volume_tags = {
    Name = var.instanceName
  }

  connection {
    type        = "ssh"
    user        = "centos"
    private_key = file(var.keyPath)
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",
      "yum -y install ansible git bind-utils sshpass",
      "sudo ansible-galaxy install git+https://github.com/openstack/ansible-hardening",
    ]
  }
} 
