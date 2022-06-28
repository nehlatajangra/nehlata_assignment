output "vpc_id" {
  value="${aws_vpc.my_vpc.id}"
}
output "cidr_block" {
  value="${var.vpc_cidr}"
}
output "availability_zone" {
  value="${var.availability_zone}"
}
output "subnet_cidr" {
  value="${var.subnet_cidr}"
}