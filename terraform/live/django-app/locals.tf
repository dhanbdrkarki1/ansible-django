locals {
  my_public_ip = "${chomp(data.http.my_public_ip.response_body)}/32" # removing new line and append /32 to IP
  tags = {
    Environment = "Dev"
    Project     = "DBK-blog"
    ManagedBy   = "Terraform"
    OwnedBy     = "Dhan"
  }
}
