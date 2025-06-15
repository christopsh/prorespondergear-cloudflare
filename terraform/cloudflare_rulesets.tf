resource "cloudflare_zone_settings_override" "security_settings" {
  zone_id = "f4b176ccc0a0c9307f69cc17980d7137"
  settings {
    waf                   = True
    browser_check         = True
    security_level        = "high"
  }
}

resource "cloudflare_bot_management" "default" {
  zone_id = "f4b176ccc0a0c9307f69cc17980d7137"
  enable_js   = True
  fight_mode  = True
}


resource "cloudflare_firewall_rule" "block_common_bot_user_agents" {
  zone_id  = "f4b176ccc0a0c9307f69cc17980d7137"
  description = "Block Common Bot User Agents"
  filter {
    expression = "(http.user_agent contains "bot" or http.user_agent contains "spider")"
  }
  action    = "challenge"
  priority  = 10
}

resource "cloudflare_firewall_rule" "allow_my_office_ip" {
  zone_id  = "f4b176ccc0a0c9307f69cc17980d7137"
  description = "Allow My Office IP"
  filter {
    expression = "(ip.src eq TODO: 203.0.113.1)"
  }
  action    = "allow"
  priority  = 5
}
