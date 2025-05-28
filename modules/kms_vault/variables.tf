variable "description" {
  type        = string
  description = "Descripción de la clave KMS"
}

variable "alias_name" {
  type        = string
  description = "Nombre del alias KMS"
}

variable "enable_key_rotation" {
  type    = bool
  default = true
  description = "habilitar rotacion de clave"
}
