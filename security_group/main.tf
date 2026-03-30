




















module "ingress_alb" {
    #source = "../../terraform-aws-securitygroup"
    source =  "git::https://github.com/SRINUNAIK208/security-group-module.git?ref=main"
    project = var.project
    environment = var.environment

    sg_name = "ingress-alb"
    sg_des = "for ingress alb"
    vpc_id = local.vpc_id
}

module "bastion" {
    #source = "../../terraform-aws-securitygroup"
    source =  "git::https://github.com/SRINUNAIK208/security-group-module.git?ref=main"
    project = var.project
    environment = var.environment

    sg_name = "bastion"
    sg_des = "for bastion"
    vpc_id = local.vpc_id
}

module "vpn" {
    #source = "../../terraform-aws-securitygroup"
    source =  "git::https://github.com/SRINUNAIK208/security-group-module.git?ref=main"
    project = var.project
    environment = var.environment

    sg_name = "openvpn"
    sg_des = "creating sg for openvpn"
    vpc_id = local.vpc_id
}

module "eks_control_plane" {
    #source = "../../terraform-aws-securitygroup"
    source =  "git::https://github.com/SRINUNAIK208/security-group-module.git?ref=main"
    project = var.project
    environment = var.environment

    sg_name = "eks_control_plane"
    sg_des = "creating sg for eks_control_plane"
    vpc_id = local.vpc_id
}

module "eks_node" {
    #source = "../../terraform-aws-securitygroup"
    source =  "git::https://github.com/SRINUNAIK208/security-group-module.git?ref=main"
    project = var.project
    environment = var.environment

    sg_name = "eks_node"
    sg_des = "creating sg for eks_"
    vpc_id = local.vpc_id
}

resource "aws_security_group_rule" "ingress_alb_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.ingress_alb.sg_id
}

resource "aws_security_group_rule" "bastion_laptop" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.bastion.sg_id
}
resource "aws_security_group_rule" "eks_contol_plane_eks_node" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  source_security_group_id = module.eks_control_plane.sg_id
  security_group_id = module.eks_node.sg_id
}
resource "aws_security_group_rule" "eks_node_eks_control_plane" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  source_security_group_id = module.eks_node.sg_id
  security_group_id = module.eks_control_plane.sg_id
}
resource "aws_security_group_rule" "eks_control_plane_bastion" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.eks_control_plane.sg_id
}
resource "aws_security_group_rule" "eks_node_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id = module.eks_node.sg_id
}
resource "aws_security_group_rule" "eks_node_vpc" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["10.0.0.0/16"]
  security_group_id = module.eks_node.sg_id
}