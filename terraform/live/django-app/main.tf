#================================
# Django Server
#================================
module "django_server" {
  source   = "../../modules/services/ec2"
  create   = true
  name     = "djamgo-server1"
  ami_type = "ubuntu_22" # Valid values: "amazon_linux2", "amazon_linux2023", "ubuntu_22", "ubuntu_24"
  # ami_id             = "ami-0f6fb3532db9b82dd" # Specific AMI ID to use. If provided, this will override ami_type"
  subnet_ids         = data.aws_subnets.default.ids
  availability_zones = ["us-east-2a"]
  instance_type      = "t3.small"

  # Volume configuration
  volume_size               = 20
  volume_type               = "gp3"
  encrypt_ebs               = true
  delete_ebs_on_termination = true

  key_name                    = "dhan"
  security_groups_ids         = [module.web_sg.security_group_id, module.bastion_sg.security_group_id]
  associate_public_ip_address = true
  user_data_replace_on_change = true
  # user_data                   = base64encode(file("${path.root}/user-data/setup-docker.sh"))
  custom_tags = local.tags
}
