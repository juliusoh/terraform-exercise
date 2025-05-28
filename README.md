# Terraform Interview Exercise 

## Overview

This repository contains a broken Terraform configuration for a simple web application. Your task is to identify and fix the issues to make the configuration work properly.

## Setup Instructions

1. Clone this repository
2. Install Terraform (version 1.5+ recommended)
3. Navigate to the project directory
4. Fix the issues in the Terraform configuration
5. Run `terraform init`, `terraform plan --var-file=terraform.tfvars`, and `terraform apply --var-file=terraform.tfvars`

## Scenario

You're working on a simple web application configuration that needs:

- Basic application configuration files
- Environment-specific settings
- Proper resource dependencies

## Expected Fixes

There are **3-4 issues** in this codebase that need to be fixed:

- Syntax errors
- Missing variables
- Resource dependency issues
- Output configuration problems

## Success Criteria

- All Terraform commands (`init`, `plan`, `apply`) run without errors
- Resources are created with proper dependencies
- Outputs display correct information

## Note

This exercise uses local providers and doesn't provision real infrastructure. You can safely run `terraform apply` without incurring any costs.

## Time Expectation

This exercise should take 10-15 minutes for an intermediate-level engineer.
