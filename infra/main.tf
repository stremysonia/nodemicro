
#module "iam" {
#    source = "./modules/iam"
#    namespace = var.namespace
#}

module "eks_cluster" {
    source = "./modules/eks_cluster"
    namespace = var.namespace
    vpc_pub_sub = module.networking.public_subnets
    vpc_priv_sub = module.networking.private_subnets
    cluster_version = var.cluster_version
    cluster_service_ipv4_cidr = var.cluster_service_ipv4_cidr
    cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
    cluster_endpoint_private_access = var.cluster_endpoint_private_access
    cluster_endpoint_public_access = var.cluster_endpoint_public_access
}

module "networking" {
    source = "./modules/networking"
    vpc_cidr_block = var.vpc_cidr_block
    public_subnets  = var.public_subnets           
    private_subnets = var.private_subnets
    namespace = var.namespace

    depends_on = [module.eks_cluste]
}
