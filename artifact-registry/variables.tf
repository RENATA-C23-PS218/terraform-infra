variable "repository_id" {
  type        = string
  description = "This is the image registry for the development environment"
  default     = "renata-repository"
}

variable "region" {
  type        = string
  description = "The region of the registry"
}
