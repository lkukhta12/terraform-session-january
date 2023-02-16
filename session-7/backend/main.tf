resource "aws_db_instance" "main" {
  allocated_storage    = 10
  identifier = replace(local.name, "resource", "rds") # this is the name of the instance created for RDS
  db_name              = "mydb"         # this is database name inside RDS instance
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "admin"  # admin user
  password             = random_password.db_password.result
  skip_final_snapshot  = var.env != "prod" ? true : false # "prod" == "prod" ? false: true this means that final snapshot will be created, "fasle" means will create the snapshot
  final_snapshot_identifier = var.env != "prod" ? null : "${var.env}-db-final-snapshot" # if the enviroment is prod the snapshot identifies is needed, otherwise not
}

#if enviroment is prod, set to false
#else set to true
#prod == prod ? skip_final_snapshot  = false : skip_final_snapshot  = true

resource "random_password" "db_password" {
    length = 20
    special = true
    override_special = "%@"
}

#Equality Operators
# Equal a==a: means a equals a
# Doe snot Equal != , a != b : a doesn't equal b
#Conditional Expression
