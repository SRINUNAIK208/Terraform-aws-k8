resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project}/${var.environment}/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id
}

resource "aws_ssm_parameter" "public_subnet_id" {
  name  = "/${var.project}/${var.environment}/public_subnet_id"
  type  = "StringList"
  value = join(",",module.vpc.subnet_public)
}
resource "aws_ssm_parameter" "private_subnet_id" {
  name  = "/${var.project}/${var.environment}/private_subnet_id"
  type  = "StringList"
  value = join(",",module.vpc.subnet_private)
}
resource "aws_ssm_parameter" "database_subnet_id" {
  name  = "/${var.project}/${var.environment}/database_subnet_id"
  type  = "StringList"
  value = join(",",module.vpc.subnet_database)
}

resource "aws_ssm_parameter" "public_avalibility_zone" {
  name  = "/${var.project}/${var.environment}/public_avalibility_zone"
  type  = "StringList"
  value = join(",",module.vpc.public_avalibility_zone)
}

resource "aws_ssm_parameter" "private_avalibility_zone" {
  name  = "/${var.project}/${var.environment}/private_avalibility_zone"
  type  = "StringList"
  value = join(",",module.vpc.private_avalibility_zone)
}
resource "aws_ssm_parameter" "database_avalibility_zone" {
  name  = "/${var.project}/${var.environment}/database_avalibility_zone"
  type  = "StringList"
  value = join(",",module.vpc.database_avalibility_zone)
}
