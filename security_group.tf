resource "aws_security_group" "dbSg" {
  name        = "Database Sg"
  description = "Allow port 3306"
  vpc_id      = data.aws_vpc.talent-academy.id

  ingress {
    description      = "MySql access"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    ssecurity_groups = [data.aws_security_group.ansible_server.id]  
    }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db_sg"
  }
}