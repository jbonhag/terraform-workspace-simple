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

resource "random_id" "id" {
  byte_length = 16
}

output "random_id" {
  value = random_id.id.id
}
