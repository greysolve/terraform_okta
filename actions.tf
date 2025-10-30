# actions.tf
resource "auth0_action" "user_provisioning" {
  name    = "user-provisioning"
  runtime = "node18"
  trigger {
    id = "post-login"
  }
  
  code = <<-EOT
    exports.onExecutePostLogin = async (event, api) => {
      // SCIM-like provisioning logic
      if (event.user.app_metadata.needs_provisioning) {
        // Add user to external system
        api.user.setAppMetadata("provisioned", true);
      }
    };
  EOT
}