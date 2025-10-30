# scim_connection.tf
resource "auth0_connection" "scim" {
  name     = "SCIM-Connection"
  strategy = "auth0"
  
  options {
    password_policy = "good"
    brute_force_protection = true
    
    # Enable SCIM-like provisioning
    import_mode = false
    disable_signup = false
    requires_username = false
  }
}

# Create SCIM-compatible app
resource "auth0_client" "scim_app" {
  name        = "SCIM Test App"
  description = "App with SCIM-like provisioning"
  app_type    = "regular_web"
  
  callbacks = ["https://example.com/callback"]
  
  jwt_configuration {
    alg = "RS256"
  }
}