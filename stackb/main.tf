resource "null_resource" "validate_token" {
  provisioner "local-exec" {
    command = <<EOT
      expected="fake-api-token-12345"
      if [ "$expected" = "${TF_VAR_my_fake_sensitive_token}" ]; then
        echo "✅ Token matches exactly!"
      else
        echo "❌ Token mismatch!"
        echo "Got token: [REDACTED]"
        exit 1
      fi
    EOT
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
