resource "cloudflare_zone_settings_override" "zone_settings" {
  zone_id = var.cloudflare_zone_id
}
