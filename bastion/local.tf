locals {
    ami_id = data.aws_ami.joindevops.id
    common_tags = {
        project = var.project
        environment = var.environment
        terraform = true
    }
    bastion_sg_id =  data.aws_ssm_parameter.bastion_sg_id.value
    public_subnet_id = split(",",data.aws_ssm_parameter.public_subnet_id.value)
    public_availability_zone = split(",",data.aws_ssm_parameter.public_avalibility_zone.value)
}