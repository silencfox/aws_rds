resource "random_password" "rds_password" {
  length           = 20
  special          = true
}

locals {
  rds_username = var.rds_user_name
  rds_password = random_password.rds_password.result
}

module "rds_credentials_secret" {
  source        = "./modules/secretos"
  secret_name   = var.rds_secret_name
  #kms_key_id    = module.kms.key_id
  kms_key_id    = var.existing_kms_key_arn

  secret_values = {
    username = local.rds_username
    password = local.rds_password
    host     = module.rds_cluster.cluster_endpoint
    port     = "5432"
    database = var.rds_db_name
  }
}

module "vpc" {
  source                = "./modules/vpc"
  name_prefix           = var.vpc_name_prefix
  vpc_cidr              = var.vpc_cidr
  private_subnet_cidrs  = var.private_subnet_cidrs
  availability_zones    = var.availability_zones
}

#module "kms" {
#  source              = "./modules/kms_vault"
#  alias_name          = var.kms_alias_name
#  enable_key_rotation = true
#}

module "s3" {
  source       = "./modules/s3_bucket"
  bucket_name  = var.bucket_name
  #kms_key_arn  = module.kms.key_arn
  kms_key_arn  = var.existing_kms_key_arn

}

module "db_subnet_group" {
  source     = "./modules/db_snet_group"
  name       = var.db_subnet_group_name
  subnet_ids = module.vpc.private_subnet_ids
}

module "rds_sg" {
  source        = "./modules/sec_group"
  name          = var.rds_sg_name
  description   = "Security Group de PostgreSQL"
  vpc_id        = module.vpc.vpc_id
  allowed_cidrs = module.vpc.private_subnet_cidrs
}

module "rds_cluster" {
  source              = "./modules/rds_db_cluster"
  cluster_identifier  = var.rds_cluster_name
  engine_version      = "15.4"
  master_username     = local.rds_username
  master_password     = local.rds_password
  database_name       = var.rds_db_name
  instance_class      = "db.r6g.medium"
  instance_count      = 2
  publicly_accessible = false
  subnet_group_name   = module.db_subnet_group.name
  security_group_ids  = [module.rds_sg.id]
#  kms_key_id          = module.kms.key_arn
   kms_key_id         = var.existing_kms_key_arn
  
}

