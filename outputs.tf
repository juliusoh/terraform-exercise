# Output definitions

output "app_id" {
  description = "Unique application ID"
  value       = random_id.app_id.hex
}

# Issue 5: This output references the wrong attribute name
output "config_file_path" {
  description = "Path to the application config file"
  value       = local_file.app_config.file_path 
}

output "web_config_path" {
  description = "Path to the web server config"
  value       = local_file.web_config.filename
} 