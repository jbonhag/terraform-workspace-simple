terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.3.1"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.40.0"
    }
  }
}

variable "organization" {
  type = string
}

variable "random_id_count" {
  type    = number
  default = 5
}

resource "random_id" "this" {
  count       = var.random_id_count
  byte_length = 16
}

output "random_ids" {
  value = [for random_id in random_id.this : random_id.id]
}

module "module" {
  for_each     = toset(["dev", "test", "prod", "dr"])
  source       = "./module"
  organization = var.organization
}
