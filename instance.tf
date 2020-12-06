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
      "sudo yum -y install ansible git sshpass",
      "sudo subscription-manager repos --enable ansible-2.9-for-rhel-8-x86_64-rpms",
      "sudo -y yum install epel-release python-argcomplete",
      "sudo ansible-galaxy install git+https://github.com/openstack/ansible-hardening",
    ]
  }
} 
