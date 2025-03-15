#================================
# Bastion Security Groups
#================================
module "bastion_sg" {
  source      = "../../modules/services/sg"
  create      = true
  name        = "bastion-sg"
  description = "Security group for Bastion Host"
  vpc_id      = data.aws_vpc.default.id # Use the default VPC
  # ingress_cidr_blocks = [local.my_public_ip]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"] # allows port 22
  egress_rules        = ["all-all"]
  custom_tags         = local.tags
}

#================================
# Web Security Groups
#================================
module "web_sg" {
  source              = "../../modules/services/sg"
  create              = true
  name                = "web-sg"
  description         = "Security group for Web Server."
  vpc_id              = data.aws_vpc.default.id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  egress_rules        = ["all-all"]
  custom_tags         = local.tags
}
