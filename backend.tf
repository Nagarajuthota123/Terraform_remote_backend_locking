terraform {
    backend "s3" {
        bucket         = "my-terraform-state-bucket"
        key            = "terraform/state"
        region         = "us-west-2"
        dynamodb_table = "your_custom_table_name"
    }
}
