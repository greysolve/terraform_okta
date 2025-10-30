# Test resource to verify setup
resource "auth0_client" "terraform_test" {
  name        = "Terraform Test App"
  description = "Testing Terraform Cloud integration"
  app_type    = "regular_web"

  callbacks = ["http://localhost:3000/callback"]

  grant_types = [
    "authorization_code",
    "refresh_token"
  ]
}

output "client_id" {
  value     = auth0_client.terraform_test.client_id
  sensitive = true
}