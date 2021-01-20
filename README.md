# Terraform AWS

Terraform Infrastructure as code to provision AWS EC2 computing engines and S3 Storage.

# How to Run

## Project requirements

- [terraform](https://www.terraform.io/) >= 0.14
- [aws cli](https://aws.amazon.com/en/cli/) >= 1.18

## AWS

- Create an AWS user for the project
- Give the user administrator permissions
- Download the user csv credentials

In your local development machine, run AWS configuration and insert user credentials

```{sh}
aws configure
```

## Provisioning

Start Terraform

```{sh}
terraform init
```

Preview your provisioning structure

```{sh}
terraform plan
```

Apply your provisioning recipe

```{sh}
terraform apply
```

## Authentication

Create a ssh key pair named "terraform-aws" and "terraform-aws.pub" and add it to the project root folder

```{sh}
ssh-keygen -f terraform-aws -t rsa
mv terraform-aws ~/.ssh/terraform-aws
```

Import your terraform-aws.pub key to AWS EC2 key pairs and use your private key to ssh

SSH to EC2

```{sh}
ssh -i ~/.ssh/terraform-aws [user]@[ip].[region].compute.amazonaws.com
```

**You can use the same ssh key pair for any AWS region, but you will need to upload the ssh pub key again**
