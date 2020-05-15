**How to use this module**
-
```
provider "aws" {
  region = "eu-west-1"
}
module "my-mysql-db" {
  source        = "github.com/yogmangela/terra-modules//mysql"
  my-access-key = "your access key"
  my-secret-key = "your secret key"
}
```

- then do ``terraform plan`` and ``terraform apply``

- when entered yes you should have mysql db up and running. check RDS service

```
  Enter a value: yes

module.my-mysql-db.aws_db_instance.db_mysql: Creating...
module.my-mysql-db.aws_db_instance.db_mysql: Still creating... [10s elapsed]
module.my-mysql-db.aws_db_instance.db_mysql: Still creating... [3m10s elapsed]
module.my-mysql-db.aws_db_instance.db_mysql: Still creating... [3m50s elapsed]
module.my-mysql-db.aws_db_instance.db_mysql: Creation complete after 3m56s [id=terraform-20200512124716798000000001]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
PS C:\Users\Yogs\Documents\AWS\01 AWS DevOps Jan-March-2020\04 Terraform>
```
