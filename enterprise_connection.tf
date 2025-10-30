# enterprise_connection.tf
resource "auth0_connection" "enterprise" {
  name     = "enterprise-saml"
  strategy = "samlp"
  
  options {
    sign_in_endpoint = "https://example.com/saml/login"
    signing_cert     = file("saml.cert")
    
    # SCIM-like user provisioning
    user_id_attribute = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress"
    protocol_binding = "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"
  }
}