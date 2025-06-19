# Terraform configuration for a simple web application
# This configuration demonstrates common patterns and potential issues in Terraform

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
    random = {
      source = "hashicorp/random"
      # TODO: Add appropriate version constraint for the random provider
      # Consider security implications of random number generation
    }
  }
}

provider "local" {}
provider "random" {}

# Generate a unique ID for the application
# TODO: Fix the syntax and consider adding additional configuration
# - Consider the implications of changing byte_length
# - Think about adding keepers for consistent IDs
resource "random_id" app_id {
  byte_length = 4
}

# Application configuration
# TODO: Add missing variable declarations and validate inputs
# - Check for missing environment variable
# - Validate file paths and permissions
# - Consider adding sensitive content handling
resource "local_file" "app_config" {
  filename = "config/${var.environment}/app.json"
  

  content = jsonencode({
    app_name    = var.app_name
    environment = var.environment
    app_id      = random_id.app_id.hex
    port        = var.app_port
    database = {
      host = "localhost"
      port = 5432
    }
  })
}

# Web server configuration
# TODO: Address dependency and security concerns
# - Add explicit dependencies if needed
# - Validate port numbers
# - Consider adding file permissions
# - Think about template validation
resource "local_file" "web_config" {
  filename = "config/${var.environment}/web.conf"
  
  content = <<-EOT
    server {
      listen ${var.app_port};
      server_name ${var.app_name}.local;
      
      location / {
        proxy_pass http://localhost:3000;
      }
    }
  EOT
} 