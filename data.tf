data "aws_vpc" "rds-vpc" {
    filter {
        name   = "tag:Name"
        values = ["lab_vpc"]
    }
}

data "aws_subnet" "private" {
    filter {
      name   = "tag:Name"
      values = ["private"]
    }
}

data "aws_subnet" "data" {
    filter {
        name   = "tag:Name"
        values = ["data"]
    }  
}

data "aws_security_group" "ansible_server" {
    filter {
      name   = "tag:Name"
      values = ["ansible-server"]
    }
}