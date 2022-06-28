terraform {
  backend "s3" {
      bucket = "s3-for-assignment"
      key="terraform.tfstate"
      dynamodb_table = "NehLata-table"
      region = "us-east-1"
  
    
  }
}