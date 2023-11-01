#state file
resource "aws_s3_bucket" "terraform_state" {
  bucket = "vas-tfstate-aws"

  #no accidental deletion
  lifecycle {
    prevent_destroy = true
  }

  #versioning for state
  versioning {
    enabled = true
  }

  #encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

#locking
resource "aws_dynamodb_table" "terraform_locks" {
  name = "tfstate-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }
}

