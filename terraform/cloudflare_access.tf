
resource "cloudflare_access_application" "admin_panel_access" {
  zone_id     = "f4b176ccc0a0c9307f69cc17980d7137"
  name        = "Admin Panel Access"
  domain      = "admin.{{ domain_name }}"
  type        = "self_hosted"
}


resource "cloudflare_access_policy" "allow_admins_1" {
  application_id = cloudflare_access_application.admin_panel_access.id
  name           = "Allow Admins"
  precedence     = 1
  decision       = "allow"

  include {
    email = ['TODO: admin@{{ domain_name }}', 'TODO: devteam@yourcompany.com']
  }
}


