
# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.common_tags, {
    Name = "${var.common_tags["environment"]}-${var.common_tags["project"]}-igw"
  })
}