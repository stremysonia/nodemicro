output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "subnets" {
  value = concat(module.vpc.private_subnets, module.vpc.public_subnets)
}