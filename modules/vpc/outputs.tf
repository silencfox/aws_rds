output "vpc_id" {
  value = aws_vpc.this.id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.this.name
}

output "private_subnet_cidrs" {
  value = aws_subnet.private[*].cidr_block
}