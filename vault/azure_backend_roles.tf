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


resource "vault_azure_secret_backend_role" "azure_contributor_role" {
  for_each = local.subscriptions
  provider = vault.cloud
  backend  = vault_azure_secret_backend.azure.path
  role     = format("%s_contributor", each.value.sub_id)
  ttl      = 14400
  max_ttl  = 28800

  azure_roles {
    role_name = "Contributor"
    scope     = "/subscriptions/${each.value.sub_id}"
  }
}