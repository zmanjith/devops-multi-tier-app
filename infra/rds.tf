resource "aws_db_subnet_group" "rds_subnet_group" {
    name = "rds-subnet-group"
    subnet_ids = [aws_subnet.private_a.id, aws_subnet.private_b.id]
}

resource "aws_db_instance" "postgres" {
    allocated_storage       = 20
    engine                  ="postgres"
    engine_version          ="15.13"
    instance_class          ="db.t3.micro"
    db_name                 = var.db_name
    username                = var.db_username
    password                = var.db_password
    db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
    vpc_security_group_ids  = [aws_security_group.db_sg.id]
    skip_final_snapshot     = true
    publicly_accessible     = false 
   
}
