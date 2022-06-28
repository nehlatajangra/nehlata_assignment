
variable "subnet_cidr" {
  type=map(string)
  description = "subnet cidr for vpc"
  sensitive = false
}
variable "availability_zone" {
  type=string
  description = "availability zone for subnet"
  sensitive = false
}
variable "vpc_cidr" {
  type=string
  description = "vpc cidr value"
  sensitive = false
}
variable "vpc_enable_dns" {
  type=bool
  description = "enable_dns_hostnames permission "
  sensitive = false
}
