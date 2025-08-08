//ec2 instance

resource "aws_instance" "web" {
	ami = "ami-084a7d336e816906b"
	instance_type 	= "t2.micro"
	subnet_id	= aws_subnet.public.id
	vpc_security_group_ids	= [aws_security_group.web_sg.id]
	key_name	= aws_key_pair.deployer.key_name
	
	user_data = <<-EOF
		#!/bin/bash
		yum update -y
		yum install -y python3  git
		pip3  install flask
	EOF

	tags = {
	  Name = "web-instance"
	}
}
