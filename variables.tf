# Variable definitions

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "myapp"
}

# Issue: Missing variable "environment" that's used in main.tf

variable "app_port" {
  description = "Port for the application"
  type        = number
  default     = 8080
}

variable "database_port" {
  description = "Port for the database"
  # Issue 3: Wrong type - should be number
  type    = string
  default = "5432"
}

# Issue 4: Variable declared but never used
variable "unused_variable" {
  description = "This variable is never used"
  type        = string
  default     = "unused"
}

# Issue 5: Missing variable for api_key that's used in main.tf

# Issue 6: Variable with invalid default value
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  # Issue 7: Invalid CIDR format
  default = "10.0.0.0"
}

# Issue 8: Sensitive variable without proper handling
variable "admin_password" {
  description = "Admin password"
  type        = string
  default     = "admin123"  # Issue 9: Hardcoded password
} 

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}