variable "cluster_identifier" {
  type = string
  description = "nombre del cluster"
}

variable "engine_version" {
  type    = string
  default = "15.4"
  description = "version del cluster"
}

variable "master_username" {
  type = string
  description = "Usuario de la Espada Maestra y Navi"
}

variable "master_password" {
  type = string
  description = "Espada maestra"
}

variable "database_name" {
  type = string
  description = "nombre de DB"
}

variable "instance_class" {
  type    = string
  default = "db.r6g.medium"
  description = "tipo de instancia"
}

variable "instance_count" {
  type    = number
  default = 2
  description = "cantidad de instancias"
}

variable "publicly_accessible" {
  type    = bool
  default = false
  description = "de kelvin alcala para el mundo?"
}

variable "security_group_ids" {
  type = list(string)
  description = "grupos de seguridad"
}

variable "subnet_group_name" {
  type = string
  description = "nombres de grupo subnet"
}

variable "kms_key_id" {
  type = string
  description = "ide de kms"
}
