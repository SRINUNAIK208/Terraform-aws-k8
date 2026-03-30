terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "6.26.0"
        }
    }
    backend "s3" {
        bucket = "devops-srinu-remote-state"
        key = "sg-module-remote-state-Terraform"
        region = "us-east-1"
        encrypt = true
        use_lockfile = true
    }
}

provider "aws" {
    region = "us-east-1"
}
# 