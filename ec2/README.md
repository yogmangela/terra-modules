# EC2 - Docker bootstrap using terraform module:
### Add below provide and EC2-terra module into your main.tf file
```
provider "aws" {
    version = "~> 2.62"
    region="eu-west-1" // Ireland region
}

module "my-EC2" {
    source = "github.com/yogmangela/terra-modules//ec2"
    access_key = "Add your access key"
    secret_key = "Add your secret key"
    region = "eu-west-1" 
    key_name = "add your key name"
    security_groups=["add your SG"] Make sure you rprovide this as a list [""], not a string
}
```

### Add bashfile ``install_docker.sh`` file and add below bash-script can copy from my repo.
```
#! /bin/bash
sudo apt update
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu
```
### Run ``terraform init`` to download ec2 module from my github account

### Run ``terraform validate`` to validate your code

### Run ``terraform plan`` to see blue print of your infrastructure.

### RUN ``Terraform apply`` & Enter your region ``eu-west-1``

```
PS C:\Users\Yogs\Desktop\test> terraform apply
provider.aws.region
  The region where AWS operations will take place. Examples
  are us-east-1, us-west-2, etc.

  Enter a value:

```

### to access instance:
- use (gitbash or MobaXterm) to login to instance
- and run ``docker version`` you should get below output

```
ubuntu@ip-172-31-36-38:~$ docker version
Client:
 Version:           19.03.6
 API version:       1.40
 Go version:        go1.12.17
 Git commit:        369ce74a3c
 Built:             Fri Feb 28 23:45:43 2020
 OS/Arch:           linux/amd64
 Experimental:      false

Server:
 Engine:
  Version:          19.03.6
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.12.17
  Git commit:       369ce74a3c
  Built:            Wed Feb 19 01:06:16 2020
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.3.3-0ubuntu1~18.04.2
  GitCommit:
 runc:
  Version:          spec: 1.0.1-dev
  GitCommit:
 docker-init:
  Version:          0.18.0
  GitCommit:
ubuntu@ip-172-31-36-38:~$
```

## We have bootstrap EC2 instance to install Docker.  

### RUN ``terraform destroy`` to terminate instance
