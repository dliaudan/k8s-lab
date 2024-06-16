variable "asg_name" {
  description = "asg name"
  type        = string
  default     = "default_asg"
}

variable "asg_ec2_type" {
  description = "ec2 type for asg"
  type        = string
  default     = "t3.micro"
}

variable "asg_ami" {
  description = "ami for ec2"
  type        = string
  default     = "ubuntu"
}

variable "init_script_file" {
  description = "user data for installing some stuff on instances"
  type        = string
  default     = "kek.sh"
}

variable "min_size" {
  description = "asg minimum instances"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "asg maximum instances"
  type        = number
  default     = 1
}

variable "desired_capacity" {
  description = "asg desired instances"
  type        = number
  default     = 1
}

variable "scale_up_recurrance" {
  description = "asg desired instances"
  type        = string
  default     = "0 18 * * *"
}


variable "scale_down_recurrance" {
  description = "asg desired instances"
  type        = string
  default     = "0 1 * * *"
}

variable "vpc_zone_identifier" {
  description = "List of subnet IDs"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of SG IDs"
  type        = list(string)
}