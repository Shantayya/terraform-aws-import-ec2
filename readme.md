# Steps to import existing aws object into terraform
## 2 ways
### 1. using terraform import imperative command 
```
1. create main.tf file with empty resource definitaion
resouce "aws_instance" "name"{

}

2. create provider.tf file with provider block
terraform {
    required_providers {
      aws = {
         source = "hashicorp/aws"
         version = "5.30.0"
      }
    }
}

provider "aws" {
  region = var.region
}

3. initialize the terraform workspace so that terraform install provider and modules and use them in script
terraform init

4. execute below command to import existing aws object into terraform 
terraform import aws_instance.name <existing _aws_instance_id>
terraform import aws_instance.web i-0a4bdd3f04077a85d

5. above command will successfully import existing aws resource in terraform and create state file. 
but terraform config file will not be updated. 
```
### 2. using import block
```
1. create provider.tf file with provider block
terraform {
    required_providers {
      aws = {
         source = "hashicorp/aws"
         version = "5.30.0"
      }
    }
}

provider "aws" {
  region = var.region
}

2. create main.tf file with import block
import {
    id = "aws_instance_id"
    to = aws_instance.instance_name                 like aws_instance.web
}

3. initialize the terraform workspace so that terraform install provider and modules and use them in script
terraform init

4. execute below command to import existing aws object into terraform by generating config file
terraform plan -generate-config-out=<resource_file_name.tf>
terraform plan -generate-config-out=main_resource.tf
```



