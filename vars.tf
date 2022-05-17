variable "default_region" {
  default = "eu-west-3"
}

variable "default_zone" {
  default = "eu-west-3a"
}

variable "default_zone_b" {
  default = "eu-west-3b"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "softtek-aws-intro"
}

variable "owner" {
  description = "The owner of the project"
  type        = string
  default     = "softtek"
}

variable "deployment" {
  description = "The deployment environment"
  type        = string
  default     = "terraform"
}
