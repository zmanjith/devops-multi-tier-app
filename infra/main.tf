// main.tf
provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

resource "tls_private_key" "example" {
	algorithm = "RSA"
	rsa_bits = 4096
}

resource "aws_key_pair" "deployer" {
	key_name = "deployer-key"
	public_key = tls_private_key.example.public_key_openssh
}
