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

resource "random_id" "this" {
  count       = 5
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
