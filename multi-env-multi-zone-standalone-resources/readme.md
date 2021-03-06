# multi-env-multi-zone-same-resources

## Assumsion
1. all zone with same resources but environment resource may be different

## How to use
1. select environment
```bash
cd dev
```
2. create workspaces (reminder: each environment you need to do the same)
```bash
terraform workspace new  ap_east_1
terraform workspace new  ap_east_2
```
3. select your workspace
```bash
terraform workspace select ap_east_1
```

3. terraform init
```bash
terraform init
```
4. terraform plan & apply
```bash
> terraform workspace select ap_east_1
Switched to workspace "ap_east_1".
```
```bash
> terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_security_group.sg-test-terraform will be created
  + resource "aws_security_group" "sg-test-terraform" {
      + arn                    = (known after apply)
      + description            = "sg-test-terraform-dev"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = "sg-test-terraform-dev"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "env"     = "dev"
          + "project" = "Test-workspace"
        }
      + tags_all               = {
          + "env"     = "dev"
          + "project" = "Test-workspace"
        }
      + vpc_id                 = "xxxxxxxxxxxxxx"
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```
```bash
> terraform apply
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_security_group.sg-test-terraform will be created
  + resource "aws_security_group" "sg-test-terraform" { 
      + arn                    = (known after apply)    
      + description            = "sg-test-terraform-dev"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = "sg-test-terraform-dev"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "env"     = "dev"
          + "project" = "Test-workspace"
        }
      + tags_all               = {
          + "env"     = "dev"
          + "project" = "Test-workspace"
        }
      + vpc_id                 = "xxxxxxxxxxxx"
    }

Plan: 1 to add, 0 to change, 0 to destroy.


Do you want to perform these actions in workspace "ap_east_1"?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:
```
5. if workspace name not define in variable.tf
```bash
> terraform workspace select default
Switched to workspace "default".
> terraform plan
???
??? Error: Invalid function argument
???
???   on variable.tf line 40, in locals:
???   40:     lookup(local.env, terraform.workspace)
???     ???????????????????????????????????????????????????
???     ??? local.env is object with 3 attributes
???
??? Invalid value for "inputMap" parameter: the given object has no attribute "default".
```


# auto select variable by workspace name

From variable.tf define the environment specific variable into it, calling values by `local.env_vars.xxx`, it can be use in any tf files's locals but the variable name cannot be `env_vars` and `env`