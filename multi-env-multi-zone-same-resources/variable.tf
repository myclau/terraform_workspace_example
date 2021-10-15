locals {
  env ={

    _defaults = {
      ##########  share variable ##########
      project_name="Test-workspace"
      ########################################
    }
    ################## Multi ENV #####################
    dev = {
      ##########  For aws provider ##########
      region="ap-east-1"
      access_key="xxxxxxxxxxxx"
      secret_key="xxxxxxxxxxxxxxxxxxxxxxxxxx"
      ########################################
      ##########  Custom varialbe ############
      vpc_id="xxxxxxxxxxxxxxxx"

      ########################################
    }
    prod = {
      ##########  For aws provider ##########
      region="ap-east-1"
      access_key="xxxxxxxxxxxx"
      secret_key="xxxxxxxxxxxxxxxxxxxxxxxxxx"
      ########################################
      ##########  Custom varialbe ############
      vpc_id="xxxxxxxxxxxxxxxx"

      ########################################
    }
    ##################################################
    ################## Multi ENV + Multi Zone #####################
    dev_ap_east_1= {
      ##########  For aws provider ##########
      region="ap-east-1"
      access_key="xxxxxxxxxxxx"
      secret_key="xxxxxxxxxxxxxxxxxxxxxxxxxx"
      ########################################
      ##########  Custom varialbe ############
      vpc_id="xxxxxxxxxxxxxxxx"

      ########################################
    }
    dev_ap_east_2= {
      ##########  For aws provider ##########
      region="ap-east-2"
      access_key="xxxxxxxxxxxx"
      secret_key="xxxxxxxxxxxxxxxxxxxxxxxxxx"
      ########################################
      ##########  Custom varialbe ############
      vpc_id="xxxxxxxxxxxxxxxx"

      ########################################
    }
    prod_ap_east_1= {
      ##########  For aws provider ##########
      region="ap-east-1"
      access_key="xxxxxxxxxxxx"
      secret_key="xxxxxxxxxxxxxxxxxxxxxxxxxx"
      ########################################
      ##########  Custom varialbe ############
      vpc_id="xxxxxxxxxxxxxxxx"

      ########################################
    }
    prod_ap_east_2= {
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


