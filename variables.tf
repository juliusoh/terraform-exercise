# Variable definitions

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "myapp"
}

variable "app_port" {
  description = "Port for the application"
  type        = number
  default     = 8080
}

variable "database_port" {
  description = "Port for the database"
  type    = string
  default = "5432"
}

variable "unused_variable" {
  description = "This variable is never used"
  type        = string
  default     = "unused"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "admin_password" {
  description = "Admin password"
  type        = string
  default     = "admin123"  # Bonus: Hardcoded password
} 