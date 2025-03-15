# Follow this blog for deployment

https://dhanbdrkarki.medium.com/deploy-lamp-stack-website-via-ansible-and-terraform-on-aws-cloud-a6546bc4be75

To run playbook,

```
ansible-playbook site.yml
ansible-playbook --vault-id .password site.yml
```

Checking inventory,

```
ansible-inventory -i aws_inventory/aws_ec2.yml --list
```
