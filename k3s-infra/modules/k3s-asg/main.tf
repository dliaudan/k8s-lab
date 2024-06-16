resource "aws_launch_configuration" "this" {
  name          = var.asg_name
  image_id      = var.asg_ami # Заміни на свій ID AMI
  instance_type = var.asg_ec2_type
  user_data     = file(var.init_script_file)
  associate_public_ip_address = true
  security_groups = var.security_group_ids
  
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "this" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  launch_configuration = aws_launch_configuration.this.id
  vpc_zone_identifier  = var.vpc_zone_identifier
  
  tag {
    key                 = "Name"
    value               = var.asg_name
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_schedule" "scale_down" {
  scheduled_action_name  = "scale_down"
  min_size               = 0
  max_size               = 0
  desired_capacity       = 0
  recurrence             = var.scale_down_recurrance
  autoscaling_group_name = aws_autoscaling_group.this.name
}

resource "aws_autoscaling_schedule" "scale_up" {
  scheduled_action_name  = "scale_up"
  min_size               = 1
  max_size               = 1
  desired_capacity       = 1
  recurrence             = var.scale_up_recurrance
  autoscaling_group_name = aws_autoscaling_group.this.name
}

output "autoscaling_group_id" {
  value = aws_autoscaling_group.this.id
}