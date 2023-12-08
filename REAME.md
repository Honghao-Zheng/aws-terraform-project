# Terraform Smart Home Infrastructure

This Terraform project automates the deployment of infrastructure to host a smart home application. It is designed to be modular, providing flexibility and scalability to accommodate various use cases. Below, you will find detailed instructions on how to use each module, including the required variables, outputs, and guidelines for setting up the infrastructure in different environments.

## Table of Contents

- [Modules](#modules)
  - [1. Networking Module](#1-networking-module)
  - [2. Security Module](#2-security-module)
  - [3. Application Servers Module](#3-application-servers-module)
  - [4. Database Module](#4-database-module)
  - [5. Launch Templates Module](#5-launch-templates-module)
  - [6. Load Balancing Module](#6-load-balancing-module)
- [Usage](#usage)
  - [Variables](#variables)
  - [Outputs](#outputs)
- [Environment Setup](#environment-setup)
  - [Development Environment](#development-environment)
  - [Production Environment](#production-environment)

## Modules

### 1. Networking Module

This module sets up the foundational networking components for the smart home application.

**Variables:**
- `cidr_range`: The CIDR range for the VPC.
- `vpc_name`: The name of the VPC.
- `availability_zones`: List of availability zones.
- `public_subnets`: List of CIDR blocks for public subnets.
- `private_subnets`: List of CIDR blocks for private subnets.

**Outputs:**
- `vpc_id`: The ID of the created VPC.

### 2. Security Module

This module manages security configurations, including security groups.

**Variables:**
- `vpc_id`: The ID of the VPC.

**Outputs:**
- `security_group_id`: The ID of the created security group.

### 3. Application Servers Module

This module deploys application servers within specified subnets and security groups.

**Variables:**
- `security_group_ids`: List of security group IDs.
- `public_subnet_ids`: List of public subnet IDs.
- `server_names`: List of server names.
- `ssh_key_name`: The name of the SSH key.
- `ami`: The Amazon Machine Image for EC2 instances.
- `instance_type`: The type of EC2 instance.

**Outputs:**
- `instance_ids`: List of IDs for the created EC2 instances.

### 4. Database Module

This module sets up databases required for the smart home application.

**Variables:**
- `table_names`: List of database table names.

### 5. Launch Templates Module

This module defines launch templates for EC2 instances.

**Variables:**
- `security_group_ids`: List of security group IDs.
- `public_subnet_ids`: List of public subnet IDs.
- `service_names`: List of service names.
- `instance_ids`: List of IDs for application server instances.
- `ssh_key_name`: The name of the SSH key.
- `instance_type`: The type of EC2 instance.

**Outputs:**
- `launch_template_ids`: List of IDs for the created launch templates.

### 6. Load Balancing Module

This module configures load balancing for the application servers.

**Variables:**
- `vpc_id`: The ID of the VPC.
- `service_instances_ids`: List of IDs for application server instances.
- `security_group_id`: The ID of the security group.
- `aws_public_subnet_ids`: List of public subnet IDs.
- `service_names`: List of service names.
- `availability_zones`: List of availability zones.
- `launch_template_ids`: List of launch template IDs.
- `max_capacity`: Maximum capacity for the load balancer.
- `min_capacity`: Minimum capacity for the load balancer.
- `desired_capacity`: Desired capacity for the load balancer.

## Usage

### Variables

When using each module, provide the necessary variables. Refer to the respective module documentation for variable details.

### Outputs

Each module provides outputs that may be useful in subsequent modules or for reference. Use these outputs as needed.

## Environment Setup

### Development Environment

To set up the infrastructure for development:

1. Navigate to the project root directory.
2. Create the `development.tfvars` file which contains the same variables in the `terraform.tfvars` file.
3. Modify the variables in your `development.tfvars` file to match your development environment.
4. Run `terraform init && terraform apply -var-file="development.tfvars"` to create the infrastructure.

### Production Environment

To set up the infrastructure for production:

1. Navigate to the project root directory.
2. Create the `production.tfvars` file which contains the same variables in the `terraform.tfvars` file.
3. Modify the variables in your `production.tfvars` file to match your development environment.
4. Run `terraform init && terraform apply -var-file="production.tfvars"` to create the infrastructure.

Ensure proper validation and testing are conducted before applying changes to production.

**Note:** Always follow best practices for handling sensitive information, such as credentials and private keys. 

Feel free to reach out to the maintainers of this Terraform project for further assistance or to report any issues.
