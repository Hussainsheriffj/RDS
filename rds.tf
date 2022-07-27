#creating RDS mysql DB

resource "aws_db_instance" "mysqlDb" {
  identifier           = "mysqldb1"
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name              = "demo_db"
  username             = var.username
  password             = var.password

  db_subnet_group_name = aws_db_subnet_group.rdsSubnet.name
  multi_az = true
  backup_retention_period = 1
  skip_final_snapshot  = true
  vpc_security_group_ids = []
}

resource "aws_db_subnet_group" "rdsSubnet" {
  name       = "dbSubnet"
  subnet_ids = [data.aws_subnet.private.id, data.aws_subnet.data.id]

  tags = {
    Name = "My DB subnet group"
  }
}