# Terraform Configuration Exercise

## Overview

This repository contains a Terraform configuration for a simple web application that needs some improvements. Your task is to identify and fix the issues to make the configuration work properly and follow best practices.

## Setup Instructions

1. Clone this repository
2. Install Terraform (version 1.5+ recommended)
3. Navigate to the project directory
4. Create a `terraform.tfvars` file from the example file
5. Fix the issues in the Terraform configuration
6. Run `terraform init`, `terraform plan`, and `terraform apply`

## Scenario

You're working on a web application configuration that demonstrates your understanding of:

- Terraform best practices and syntax
- Variable management and validation
- Resource dependencies and state management
- Output configuration
- Security considerations

## Expected Fixes

There are several issues in this codebase that need to be addressed:

1. Provider Configuration

   - Missing version constraints
   - Syntax errors

2. Variable Management

   - Unused variables that should be removed
   - Missing variable validations
   - Insecure default values

3. Resource Configuration

   - Dependency issues
   - Missing required attributes
   - Incorrect file paths

4. Output Configuration
   - Incorrect attribute references
   - Missing descriptions

## Success Criteria

Your solution should demonstrate:

- Clean, error-free Terraform configuration
- Proper variable validation and security practices
- Correct resource dependencies
- Working outputs
- Removal of unnecessary code
- Addition of helpful comments where needed

## Note

This exercise uses local providers and doesn't provision real infrastructure. You can safely run `terraform apply` without incurring any costs.

## Time Expectation

This exercise should take 15-20 minutes for an intermediate-level Terraform engineer.
