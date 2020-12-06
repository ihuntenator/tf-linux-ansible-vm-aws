# Terraform deploy for AWS linux instance with ansible

Install ansible and a few tools to work with jenkins and terraform for provisioning and configuring.

## ansible setup

```
sudo yum install ansible
sudo subscription-manager repos --enable ansible-2.9-for-rhel-8-x86_64-rpms
sudo yum install epel-release python-argcomplete
```

## the tfvars file

Have a tfvars file per environment to give access to AWS environment and ssh key for vm.

### dev.tfvars

```
access_key = "ACCESS_KEY"
secret_key = "SECRET_KEY"
keyName = "keyname"
keyPath = "/path/to/key"
```

## terraform run
```
terraform init
terraform validate
terraform plan -var-file=dev.tfvars -out tf.out
terraform apply "tf.out"
```

## terrarform explore

Create terraform dependency graph in DOT:
```
terraform graph
```

## terraform clean up

When finished:
```
terraform destroy -var-file=dev.tfvars
```
## References

 * https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
 * https://github.com/ansible/ansible

