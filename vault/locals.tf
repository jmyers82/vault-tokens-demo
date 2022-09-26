locals {
  subscriptions = {
    management_sub = {
        name = "JeremyExternalPortal"
        sub_id = "d995a747-3f1a-412a-bf34-655f5d44cc0f"
    }
    demo_sub = {
        name = "HashiConfAzure"
        sub_id = "57124af2-ec2e-466c-a744-c046ea95c09a"
    }
    demo_sub_2 = {
        name = "HashiConfAzure2"
        sub_id = "792b05af-6f58-4e3b-9412-eeb344463816"
    }
  }
}

locals {
  accounts = {
    aws_demo_account = {
        name = "JeremyAWS"
        account_id = "226521832964"
    }
  }
}