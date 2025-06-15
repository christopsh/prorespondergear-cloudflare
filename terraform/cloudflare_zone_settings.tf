resource "cloudflare_zone_settings_override" "zone_settings" {
  zone_id = "f4b176ccc0a0c9307f69cc17980d7137"

  settings {
    ssl                     = "full"
    brotli                  = True
    minify {
      css  = True
      html = True
      js   = True
    }
    always_use_https        = True
    automatic_https_rewrites = True
    tls_1_3                 = True
    polish                  = True
    mirage                  = True
    cache_by_device_type    = True
    security_level          = "high"
    waf                     = True
    browser_check           = True
  }
}