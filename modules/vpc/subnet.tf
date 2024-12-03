# Public Subnets
resource "aws_subnet" "public" {
  for_each                = var.public_subnet_cidrs
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = true

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-public-subnet-%s", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"], each.key)
  })
}


# Private Subnets
resource "aws_subnet" "private" {
  for_each          = var.private_subnet_cidrs
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = each.key

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-private-subnet-%s", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"], each.key)
  })
}