resource "aws_route_table" "public" {
  for_each = var.public_subnet_cidrs

  vpc_id = aws_vpc.main.id

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-public-rt-%s", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"], each.key)
  })
}

resource "aws_route" "public_internet_access" {
  for_each = aws_route_table.public

  route_table_id         = each.value.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public[each.key].id
}

resource "aws_route_table" "private" {
  for_each = var.private_subnet_cidrs

  vpc_id = aws_vpc.main.id

  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-private-rt-%s", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"], each.key)
  })
}

resource "aws_route" "private_nat_access" {
  for_each = aws_route_table.private

  route_table_id         = each.value.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[each.key].id
}

resource "aws_route_table_association" "private" {
  for_each = aws_subnet.private

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private[each.key].id
}