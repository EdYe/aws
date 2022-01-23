provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "Cobalt-UPI-Terraform-Locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    APP_ID        = "1914"
    Description   = "env=DEV/appid=1914/monitor=false"
    Billing       = "Dataplatform/UPI"
    BUSINESS_AREA = "Healthcare App"
    COST_CENTER   = "40134"
  }
}