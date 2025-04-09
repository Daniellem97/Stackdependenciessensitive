output "my_fake_sensitive_token" {
  value     = "fake-api-token-12345" # could be any string
  sensitive = true
}

terraform {
  required_providers {
    spacelift = {
      source  = "spacelift.io/spacelift-io/spacelift"
      version = "1.19.0"
    }
  }
}

provider "spacelift" {}
