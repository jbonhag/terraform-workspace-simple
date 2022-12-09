terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.3.1"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_id" "this" {
  byte_length = 16
}

resource "random_id" "that" {
  byte_length = 16
}

output "random_ids" {
  value = [random_id.this.id, random_id.that.id]
}
