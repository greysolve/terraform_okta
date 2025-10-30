# users.tf
resource "auth0_user" "test_user" {
  connection_name = "Username-Password-Authentication"
  email           = "test@example.com"
  password        = "TempPassword123!"
  email_verified  = true
}

# organizations.tf (if on paid plan)
resource "auth0_organization" "my_org" {
  name         = "test-org"
  display_name = "Test Organization"
}