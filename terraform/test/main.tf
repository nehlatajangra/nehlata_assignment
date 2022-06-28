module "new-vpc" {
  source="../"
  vpc_cidr="${var.vpc_cidr}"
  vpc_enable_dns="${var.vpc_enable_dns}"
  for_each = var.subnet_cidr
  subnet_cidr=each.value#"${var.subnet_cidr}"
  availability_zone="${var.availability_zone}"
}

