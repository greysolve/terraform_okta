resource "auth0_action" "user_provisioning" {
  name    = "user-provisioning"
  runtime = "node18"
  deploy  = true

  supported_triggers {
    id      = "post-login"
    version = "v3"
  }

  code = <<-EOT
    exports.onExecutePostLogin = async (event, api) => {
      if (!event.user.app_metadata || !event.user.app_metadata.provisioned) {
        api.user.setAppMetadata("provisioned", true);
      }
    };
  EOT
}
