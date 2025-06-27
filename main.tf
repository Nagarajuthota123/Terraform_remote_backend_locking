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
