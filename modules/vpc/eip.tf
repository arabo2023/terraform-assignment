# Elastic IPs for NAT Gateways
resource "aws_eip" "nat" {
  for_each = var.public_subnet_cidrs

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-eip-%s", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"], each.key)
  })
}