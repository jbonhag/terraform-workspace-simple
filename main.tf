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
  count = 5
  byte_length = 16
}

output "random_ids" {
  value = [ for random_id in random_id.this : random_id.id ]
}
