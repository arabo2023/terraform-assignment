# NAT Gateways
resource "aws_nat_gateway" "nat" {
  for_each      = var.public_subnet_cidrs
  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = aws_subnet.public[each.key].id

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-nat-%s", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"], each.key)
  })
}