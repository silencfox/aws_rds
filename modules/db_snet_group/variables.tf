variable "name" {
  type = string
  description = "nombre de subnet"
}

variable "subnet_ids" {
  type = list(string)
  description = "ids de subnet"
}
