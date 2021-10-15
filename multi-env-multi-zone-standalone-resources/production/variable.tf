locals {
  env ={

    _defaults = {
      ##########  share variable ##########
      project_name="Test-workspace"
      ########################################
    }
    ################## Multi ENV + Multi Zone #####################
    ap_east_1= {
      ##########  For aws provider ##########
      region="ap-east-1"
      access_key="xxxxxxxxxxxx"
      secret_key="xxxxxxxxxxxxxxxxxxxxxxxxxx"
      ########################################
      ##########  Custom varialbe ############
      vpc_id="xxxxxxxxxxxxxxxx"

      ########################################
    }
    ap_east_2= {
      ##########  For aws provider ##########
      region="ap-east-2"
      access_key="xxxxxxxxxxxx"
      secret_key="xxxxxxxxxxxxxxxxxxxxxxxxxx"
      ########################################
      ##########  Custom varialbe ############
      vpc_id="xxxxxxxxxxxxxxxx"

      ########################################
    }
    ###############################################################
  }
  env_vars = merge(
    lookup(local.env, "_defaults"),
    lookup(local.env, terraform.workspace)
  )
}


