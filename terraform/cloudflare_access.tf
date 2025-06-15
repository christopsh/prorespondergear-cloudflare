resource "cloudflare_zero_trust_access_application" "admin_panel_access" {
  account_id     = var.cloudflare_account_id
  name           = "Admin Panel"
  domain         = "admin.${var.domain_name}"
  type           = "self_hosted"
  session_duration = "24h"
}

resource "cloudflare_access_policy" "allow_admins" {
  application_id = cloudflare_zero_trust_access_application.admin_panel_access.id
  name           = "Allow Admins"
  precedence     = 1
  decision       = "allow"
  account_id     = var.cloudflare_account_id

  include {
    email = var.admin_emails
  }
}
