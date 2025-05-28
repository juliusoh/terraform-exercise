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
# Issue 2: Syntax error - missing quotes around resource name
resource "random_id" app_id {
  byte_length = 4
}

# Application configuration
resource "local_file" "app_config" {
  filename = "config/${var.environment}/app.json"
  
  # Issue 3: The JSON is valid but the variable reference is wrong
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
  
  # Issue 4: This should depend on app_config to ensure proper creation order
  # depends_on = [local_file.app_config]
} 