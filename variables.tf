variable "region" {
  type        = string
  default     = "eu-central-1"
  description = "region de la infraestructura"
}
variable "bucket_name" {
  type        = string
  default     = "deuna-bucket-encriptado"
  description = "Nombre del bucket S3"
}

variable "rds_cluster_name" {
  type        = string
  default     = "deuna-aurora-pg-cluster2"
  description = "nombre del cluster"
}

variable "rds_user_name" {
  type        = string
  default     = "pgadmin"
  description = "Usuario de la Espada Maestra y Navi"
}

variable "rds_secret_name" {
  type        = string
  default     = "deuna-aurora-db-credentials2"
  description = "nombre del secreto"
}

variable "rds_db_name" {
  type        = string
  default     = "deunadb"
  description = "nombre de la db"
}
variable "rds_sg_name" {
  type        = string
  default     = "deuna-aurora-sg2"
  description = "nombre del grupo de seguridad"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.10.0.0/16"
  description = "cidr"
}
variable "db_subnet_group_name" {
  type        = string
  default     = "deuna-subnet-group2"
  description = "nombre del grupo de subnet"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.2.0/24"]
  description = "cidr privadas"
}

variable "vpc_name_prefix" {
  type        = string
  default     = "deuna-aurora"
  description = "prefijo del nombre de vpc"
}

variable "availability_zones" {
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b"]
  description = "zonas de disponibilidad"
}

variable "kms_alias_name" {
  type        = string
  default     = "deuna-s3-bucket-key2"
  description = "alias del kmspico "
}

variable "existing_kms_key_arn" {
  description = "ARN KMS precreado"
  default     = "arn:aws:kms:eu-central-1:805400277785:key/654c0b9c-05ad-4b2b-8b43-7f1fb956f40f"
  type        = string
}

