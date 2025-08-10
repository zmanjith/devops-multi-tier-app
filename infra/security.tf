// security.tf

//# Replace with your public IP
//variable "my_ip" {
//  default = "69.162.73.8/32"
//}

# Security group for EC2 (SSH + HTTP from your IP)
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow S:SH and HTTP from my IP"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security group for DB (access only from EC2)
resource "aws_security_group" "db_sg" {
  name        = "db-sg"
  description = "Allow DB access from EC2 only"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "DB access"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
