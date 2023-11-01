output "s3_bucket_arn" {
  value = aws_s3_bucket.terraform_state.arn
  description = "the ARN of the S3 bucket for terraform state"
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_locks.name
  description = "the name of the DynamoDB table for terraform state"
}
