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
