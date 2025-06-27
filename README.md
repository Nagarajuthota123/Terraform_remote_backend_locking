Terraform Remote Backend with State Locking.

This repository demonstrates how to configure Terraform to store its state remotely in AWS S3 while using an AWS DynamoDB table for state locking. This setup prevents concurrent state modifications and ensures team-safe, reliable Terraform operations.

📁 Repository Structure
.
├── main.tf           # Core resource and provider definitions
├── backend.tf        # S3 + DynamoDB backend configuration
├── variables.tf      # Input variables for configuration
└── outputs.tf        # Output values (if any)
Note: Adjust file names or modularize as needed.

⚙️ Prerequisites
You’ll need:

Terraform v1.0+ installed and in your PATH.

AWS credentials with IAM permissions for:

S3 bucket management.

DynamoDB table creation and access.

An existing S3 bucket (or permission to create one).

🔧 Setup and Usage

1. Initialize Terraform Backend
Edit backend.tf to define your S3 bucket, key, region, and DynamoDB table:

terraform {
  backend "s3" {
    bucket         = "my-terraform-bucket"
    key            = "path/to/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state_lock_table_name"
  }
}
Next, run:

terraform init
This will configure your backend and optionally prompt to create necessary remote resources.

2. Deploy Resources
Define your AWS resources in main.tf (e.g., DynamoDB table for locking). Example:

resource "aws_dynamodb_table" "your_custom_name" {
  name         = "your_custom_table_name"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "YourCustomKey"

  attribute {
    name = "YourCustomKey"
    type = "S"
  }

  tags = {
    Name        = "YourCustomTable"
    Environment = "Production"
    Owner       = "YourTeam"
  }
}
To deploy:
terraform plan
terraform apply
Terraform will:

Create the DynamoDB table (if not existing).

Automatically acquire a state lock when modifying infrastructure.

Release the lock upon completion or error.






