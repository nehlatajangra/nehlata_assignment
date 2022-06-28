output "vpc" {
  value = {for k,v in module.new-vpc:k=>v}
}
  

