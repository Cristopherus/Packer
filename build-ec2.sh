#!/bin/bash
packer build -machine-readable packer.json | tee build.log
AMI_ID=`egrep -oe 'ami-.{8}' build.log |tail -n1`
echo 'variable "AMI_ID" { default = "'${AMI_ID}'" }' > amivar.tf
terraform init
terraform apply -auto-approve
#ssh-add ~/dev/packer/mykey
#ansible-playbook ansible/nginx.yml -i ansible/hosts 

