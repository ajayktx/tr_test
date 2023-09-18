provider "aws" {
  region = "us-east-1"
  alias  = "north_vergenia"
}

provider "aws" {
  region = "ap-south-1"
  alias  = "mumbai"
}

resource "aws_eip" "res1" {
  provider = aws.north_vergenia
  domain   = "vpc"
}

resource "aws_eip" "res2" {
  provider = aws.mumbai
  domain   = "vpc"
}

output "North-Vergenia-IP" {
  value = aws_eip.res1.public_ip
}

output "Mumbai-IP" {
  value = aws_eip.res2.public_ip
}
