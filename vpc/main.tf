module "vpc" {
    source = "git::https://github.com/SRINUNAIK208/vpc-module.git?ref=main"
    project = var.project
    environment = var.environment
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    database_subnet_cidr = var.database_subnet_cidr

}