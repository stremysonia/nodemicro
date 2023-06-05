module "networking" {
  source        = "./modules/networking" 
  public_cidrs  = var.public_cidrs            
  private_cidrs = var.private_cidrs 
  my_ip         = var.my_ip          
  namespace     = var.namespace                   
}

