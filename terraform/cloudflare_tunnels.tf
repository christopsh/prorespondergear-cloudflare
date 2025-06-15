
resource "cloudflare_tunnel" "production_web_tunnel" {
  account_id = "98a82dd8c45a4b1a534ad10a609bfca3"
  name       = "production-web-tunnel"
}

resource "cloudflare_tunnel" "staging_api_tunnel" {
  account_id = "98a82dd8c45a4b1a534ad10a609bfca3"
  name       = "staging-api-tunnel"
}
