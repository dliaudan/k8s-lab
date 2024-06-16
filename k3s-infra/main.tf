provider "aws" {
  profile = "private"
}

module "k3s-node-asg" {
  source              = ".//modules/k3s-asg"
  asg_name            = "k3s-lab-cluster"
  min_size            = 1
  max_size            = 1
  desired_capacity    = 1
  asg_ec2_type        = "t3.small"
  init_script_file    = "k3s-cluster-init.sh"
  asg_ami             = "ami-0705384c0b33c194c"
  vpc_zone_identifier = ["subnet-03c13aa240d01440c"]
  security_group_ids  = ["sg-0c3084252611c84b5"]
}