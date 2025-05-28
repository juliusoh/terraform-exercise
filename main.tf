# Terraform configuration for a simple web application

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
    random = {
      source = "hashicorp/random"
      # Issue 1: Missing version constraint
    }
  }
}

provider "local" {}
provider "random" {}

# Generate a unique ID for the application
# Issue 2: Syntax error
resource "random_id" app_id {
  byte_length = 4
}

# Application configuration.
# Issue 3: Missing variable declaration
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
### Issue 4: Missing dependency
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