terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.3.1"
    }
  }
}

variable "random_id_count" {
  type    = number
  default = 5
}

resource "random_id" "this" {
  count       = var.random_id_count
  byte_length = 16
}

resource "random_id" "that" {
  count       = var.random_id_count
  byte_length = 16
}

output "these_random_ids" {
  value = [for random_id in random_id.this : random_id.id]
}

output "those_random_ids" {
  value = [for random_id in random_id.that : random_id.id]
}
