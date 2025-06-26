provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-020cba7c55df1f615" # Amazon Linux 2 (Free tier)
  instance_type = "t2.micro"
  key_name      = "Eugine-key-pair"        # Must already exist in AWS
  tags = {
    Name = "Eugine1"
  }
}



