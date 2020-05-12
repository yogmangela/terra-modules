**How to use this module**
-
- ``terraform init`` : create and empty repository using Terraform configue file. Initialising working directory. download provider plugins

```
 module "my-s3" {
  source = "github.com/yogmangela/terra-modules//s3"
}

- once you have added above code and run ``terraform init`` you should have module downloaded into
``.terrafomr >> modules >> s3 >>``
          - main.tf, 
          - outputs.tf 
          - variables.tf and
          - README.md
 ``.terrafomr >> plugins >>
          - lock.json
          - terraform-provider-aws_v2.61.0_x4.exe

- I have set default ``bucket_name`` in variable.tf as ``01-my-sample-s3-bucket`` change to your bucker name.
**make sure bucket names are globaly unique**

```
variable "bucket_name" {
  type = string
  default = "01-my-sample-s3-bucket"
}
```
         
- Add your access and secret key to your file; 

```
 module "my-s3" {
  source = "github.com/yogmangela/terra-modules//s3"
  my-access-key = "Add your access-key"
  my-secret-key = "Add your secrete key"
}
```


- ``terraform fmt`` terraform formats into cononical format, so it will indent code correct, spacing etc.

- ``terraform valiidate`` : this will validate your code: see below
```
PS C:\Users\Yogs\Documents\AWS\01 AWS DevOps Jan-March-2020\04 Terraform> terraform validate        
Success! The configuration is valid.
```


- ``terraform plan`` : Terraform will plan your deployment, will show you what are the resources it is about to deploy.

```
PS C:\Users\Yogs\Documents\AWS\01 AWS DevOps Jan-March-2020\04 Terraform> terraform plan            
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.my-s3.aws_s3_bucket.web_bucket will be created
  + resource "aws_s3_bucket" "web_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = "private"
      + arn                         = (known after apply)
      + bucket                      = "01-my-sample-s3-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "Environment" = "Dev"
          + "Name"        = "My bucket"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

- ``terraform apply``: will create all the resources specified according to plan. 
- Once you are happy with the plan / gives you final opportinity to review your resourse.  ``type : yes `` if all looks good.

```
PS C:\Users\Yogs\Documents\AWS\01 AWS DevOps Jan-March-2020\04 Terraform> terraform plan            
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.my-s3.aws_s3_bucket.web_bucket will be created
  + resource "aws_s3_bucket" "web_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = "private"
      + arn                         = (known after apply)
      + bucket                      = "01-my-sample-s3-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "Environment" = "Dev"
          + "Name"        = "My bucket"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + versioning {
PS C:\Users\Yogs\Documents\AWS\01 AWS DevOps Jan-March-2020\04 Terraform> terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.my-s3.aws_s3_bucket.web_bucket will be created
  + resource "aws_s3_bucket" "web_bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = "private"
      + arn                         = (known after apply)
      + bucket                      = "01-my-sample-s3-bucket"
      + bucket_domain_name          = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "Environment" = "Dev"
          + "Name"        = "My bucket"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)

      + versioning {
          + enabled    = (known after apply)
          + mfa_delete = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: 
```
- here's final output, ``Apply complete! Resources: 1 added, 0 changed, 0 destroyed.`` added 1 resources.
- Go ahead and check to see that you have created s3 bucket called ``01-my-sample-s3-bucket``

```
  Enter a value: yes

module.my-s3.aws_s3_bucket.web_bucket: Creating...
module.my-s3.aws_s3_bucket.web_bucket: Creation complete after 3s [id=01-my-sample-s3-bucket]       

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

- ``terraform destory``: to delete created resources: **I am not much of a fan of destroy. sounds bit agressive. what about depricated / delete/remove**
```
PS C:\Users\Yogs\Documents\AWS\01 AWS DevOps Jan-March-2020\04 Terraform> terraform destroy
module.my-s3.aws_s3_bucket.web_bucket: Refreshing state... [id=01-my-sample-s3-bucket]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # module.my-s3.aws_s3_bucket.web_bucket will be destroyed
  - resource "aws_s3_bucket" "web_bucket" {
      - acl                         = "private" -> null
      - arn                         = "arn:aws:s3:::01-my-sample-s3-bucket" -> null
      - bucket                      = "01-my-sample-s3-bucket" -> null
      - bucket_domain_name          = "01-my-sample-s3-bucket.s3.amazonaws.com" -> null
      - bucket_regional_domain_name = "01-my-sample-s3-bucket.s3.eu-west-1.amazonaws.com" -> null
      - force_destroy               = false -> null
      - hosted_zone_id              = "Z1BKCTXD74EZPE" -> null
      - id                          = "01-my-sample-s3-bucket" -> null
      - region                      = "eu-west-1" -> null
      - request_payer               = "BucketOwner" -> null
      - tags                        = {
          - "Environment" = "Dev"
          - "Name"        = "My bucket"
        } -> null

      - versioning {
          - enabled    = false -> null
          - mfa_delete = false -> null
        }
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: 
  ```
  
  - To delete enter ``yes``
  
  ```
    Enter a value: yes

module.my-s3.aws_s3_bucket.web_bucket: Destroying... [id=01-my-sample-s3-bucket]
module.my-s3.aws_s3_bucket.web_bucket: Destruction complete after 0s

Destroy complete! Resources: 1 destroyed.
```

  
  

