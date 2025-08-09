// outputs.tf

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_key_pem" {
	value = tls_private_key.example.private_key_pem
	sensitive = true
}

 output "ec2_public_ip" {
	value = aws_instance.web.public_ip
 }


output "my_ip_used_for_ssh" {

value = var.my_ip

}

