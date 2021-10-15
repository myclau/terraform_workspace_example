provider "aws" {
  version = "~> 3.0"
  region  = local.env_vars.region
  access_key = local.env_vars.access_key
  secret_key = local.env_vars.secret_key
}
