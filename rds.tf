#creating RDS mysql DB

resource "aws_db_parameter_group" "defaultmySql" {
  name   = "rds-pg"
  family = "mysql8.0"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}

resource "aws_db_instance" "mysql" {
  identifier           = "mysqldb"
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = "mydemoDb"
  username             = var.username
  password             = var.password
  parameter_group_name = "defaultmySql"
  skip_final_snapshot  = true
}