data "aws_ami" "joindevops" {
  most_recent = true
  owners = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }



  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
  data "aws_ssm_parameter" "bastion_sg_id" {
    name = "/${var.project}/${var.environment}/bastion_sg_id"
  }
  data "aws_ssm_parameter" "public_subnet_id" {
    name = "/${var.project}/${var.environment}/public_subnet_id"
  }
  data "aws_ssm_parameter" "public_avalibility_zone" {
    name = "/${var.project}/${var.environment}/public_avalibility_zone"
  }
