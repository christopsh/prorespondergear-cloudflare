
resource "cloudflare_r2_bucket" "my_website_assets" {
  account_id = "98a82dd8c45a4b1a534ad10a609bfca3"
  name       = "my-website-assets"
  location   = "auto"
}

resource "cloudflare_r2_bucket" "backups" {
  account_id = "98a82dd8c45a4b1a534ad10a609bfca3"
  name       = "backups"
  location   = "auto"
}
