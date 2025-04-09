variable "token" {
  type = string
}

resource "null_resource" "test_auth" {
  provisioner "local-exec" {
    command = "curl -s -o /dev/null -w '%{http_code}' -H 'Authorization: Bearer ${var.token}' https://httpbin.org/bearer"
  }
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
