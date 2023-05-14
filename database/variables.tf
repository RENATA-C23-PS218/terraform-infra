variable "db_name" {
  type        = string
  description = "The name of the database"
  default     = "renata-dev-db"
}

variable "instance_name" {
  type        = string
  description = "The name of the instance"
  default     = "renata-dev"
}

variable "region" {
  type        = string
  description = "The region to create things in"
}