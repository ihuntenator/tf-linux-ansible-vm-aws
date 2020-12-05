# Terraform deploy for AWS linux instance with ansible

Install ansible and a fe few tools to work with jenkins and terraform for provisioning and configuring.

## ansible setup


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
