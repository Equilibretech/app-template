# Terraform Infrastructure

This directory contains Terraform configurations for multi-cloud infrastructure deployment supporting AWS, GCP, and Azure.

## Directory Structure

```
infra/
├── main.tf          # Main Terraform configuration
├── variables.tf     # Variable definitions
├── outputs.tf       # Output values
├── README.md        # This file
└── modules/         # Cloud-specific modules
    ├── aws/         # AWS infrastructure module
    ├── gcp/         # GCP infrastructure module
    └── azure/       # Azure infrastructure module
```

## Quick Start

1. **Choose your cloud provider** and uncomment the relevant sections in `main.tf`:
   - Provider configuration
   - Module declaration

2. **Configure variables** in `terraform.tfvars` or via environment variables:
   ```hcl
   # Example terraform.tfvars
   environment = "dev"
   project_name = "my-app"
   
   # For AWS
   aws_region = "us-east-1"
   
   # For GCP
   gcp_project_id = "my-project-123"
   gcp_region = "us-central1"
   
   # For Azure
   azure_subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
   azure_location = "eastus"
   ```

3. **Initialize Terraform**:
   ```bash
   terraform init
   ```

4. **Plan and apply**:
   ```bash
   terraform plan
   terraform apply
   ```

## Module Features

Each cloud module provides:
- **VPC/VNet** with configurable CIDR blocks
- **Subnets** (public and private for AWS, configurable for GCP/Azure)
- **NAT Gateway/Cloud NAT** for outbound connectivity
- **Storage bucket/container** with versioning and encryption
- **Basic security rules** (Security Groups/Firewall Rules/NSGs)

## Customization

### Enabling Resources
Most resources are commented out by default. To enable them:
1. Uncomment the resource blocks in the module's `main.tf`
2. Uncomment the corresponding outputs in the module's `outputs.tf`
3. Uncomment the module outputs in the root `outputs.tf`

### Adding New Resources
Each module has TODO comments indicating where to add:
- Compute resources (VMs, containers, functions)
- Database services
- Load balancers
- Monitoring and logging
- Security services

### State Management
Configure remote state backend in `main.tf`:
```hcl
terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "app-template/terraform.tfstate"
    region = "us-east-1"
  }
}
```

## Variables

Key variables across all providers:
- `environment` - Environment name (dev, staging, prod)
- `project_name` - Name of your project
- `vpc_cidr` - CIDR block for the VPC/VNet
- `common_tags` - Tags/labels to apply to all resources

Provider-specific variables are prefixed:
- `aws_*` - AWS-specific variables
- `gcp_*` - GCP-specific variables
- `azure_*` - Azure-specific variables

## Outputs

Each module exports:
- Network resource IDs (VPC, subnets, etc.)
- Storage resource names and endpoints
- Security group/firewall rule IDs

## Best Practices

1. **Use workspaces** for managing multiple environments:
   ```bash
   terraform workspace new staging
   terraform workspace select staging
   ```

2. **Lock versions** in provider configurations for consistency

3. **Use variables** for all environment-specific values

4. **Tag/label all resources** for cost tracking and management

5. **Enable state locking** when using remote backends

## Troubleshooting

- **Provider authentication**: Ensure you have proper credentials configured
  - AWS: `aws configure` or IAM role
  - GCP: `gcloud auth application-default login` or service account
  - Azure: `az login` or service principal

- **Resource limits**: Check cloud provider quotas if resource creation fails

- **State issues**: Use `terraform refresh` to sync state with actual resources