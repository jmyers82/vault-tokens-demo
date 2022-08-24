# resource "vault_policy" "aws_policy" {
#   name = "aws-create"

#   policy = <<EOT
# path "aws/creds/*" {
#   capabilities = ["read","create","update"]
# }

# path "aws/sts/*" {
#   capabilities = ["read"]
# }

# path "auth/token/create" {
#   capabilities = ["create","update"]
# }


# EOT
# }