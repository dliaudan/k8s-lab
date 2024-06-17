provider "aws" {
  profile = "private"
}

module "k3s-node-asg" {
  source              = ".//modules/k3s-asg"
  asg_name            = "k3s-lab-cluster"
  min_size            = 1
  max_size            = 1
  desired_capacity    = 1
  asg_ec2_type        = var.asg_ec2_type
  init_script_file    = var.init_script_file
  asg_ami             = var.asg_ami
  vpc_zone_identifier = var.vpc_zone_identifier
  security_group_ids  = var.security_group_ids
}