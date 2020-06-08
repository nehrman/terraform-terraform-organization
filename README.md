# Terraform Cloud / Enterprise Organization Module

A Terraform module which creates Organization on Terraform Cloud / Enterprise with the following characteristics:
- Allow to enable or not multiple VCS integrations for one organization

## Terraform versions

Support of Terraform 0.12 only.

## Usage

Organization **without** VCS integration example: 

```hcl

module "my_organization_1" {
  source                         = "app.terraform.io/<ORG_NAME>/organization/terraform"
  version                        = "1.0.0"
  org_configuration              = {
        name                     = "my_org_automation"
        email                    = "myemail@dot.com"
        session_timeout_minutes  = 20160
        session_remember_minutes = 20160
        auth_policy              = "password"
        owner_team_saml_role_id  = ""
    }


  vcs_enabled                    = false 

```

Organization **with** VCS Integration example: 

```hcl

module "my_organization_1" {
  source                         = "app.terraform.io/<ORG_NAME>/organization/terraform"
  version                        = "1.0.0"
  org_configuration              = {
        name                     = "my_org_automation"
        email                    = "myemail@dot.com"
        session_timeout_minutes  = 20160
        session_remember_minutes = 20160
        auth_policy              = "password"
        owner_team_saml_role_id  = ""
    }


  vcs_enabled                    = true 

  vcs_configuration              = [
    {
        api_url                  = "https://api.github.com"
        http_url                 = "https://github.com"
        oauth_token              = "7c345da8196149174080c912e7e236fa6138d2d7"
        private_key              = ""
        service_provider         = "github"
    }
  ]

```

## Authors

* **Nicolas Ehrman** - *Initial work* - [Hashicorp](https://www.hashicorp.com)



