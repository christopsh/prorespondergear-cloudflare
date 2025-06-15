
resource "cloudflare_record" "root_1" {
  zone_id = "f4b176ccc0a0c9307f69cc17980d7137"
  name    = "@"
  type    = "A"
  value   = "167.71.81.168"
  ttl     = 1
  proxied = True

  
}

resource "cloudflare_record" "www_2" {
  zone_id = "f4b176ccc0a0c9307f69cc17980d7137"
  name    = "www"
  type    = "A"
  value   = "167.71.81.168"
  ttl     = 1
  proxied = True

  
}

resource "cloudflare_record" "root_3" {
  zone_id = "f4b176ccc0a0c9307f69cc17980d7137"
  name    = "@"
  type    = "CAA"
  ttl     = 1
  proxied = False

  
}

resource "cloudflare_record" "root_4" {
  zone_id = "f4b176ccc0a0c9307f69cc17980d7137"
  name    = "@"
  type    = "MX"
  value   = "route3.mx.cloudflare.net."
  ttl     = 1
  proxied = False

  
  priority = 8
  
}

resource "cloudflare_record" "root_5" {
  zone_id = "f4b176ccc0a0c9307f69cc17980d7137"
  name    = "@"
  type    = "MX"
  value   = "route2.mx.cloudflare.net."
  ttl     = 1
  proxied = False

  
  priority = 68
  
}

resource "cloudflare_record" "root_6" {
  zone_id = "f4b176ccc0a0c9307f69cc17980d7137"
  name    = "@"
  type    = "MX"
  value   = "route1.mx.cloudflare.net."
  ttl     = 1
  proxied = False

  
  priority = 28
  
}

resource "cloudflare_record" "cf2024-1__domainkey_7" {
  zone_id = "f4b176ccc0a0c9307f69cc17980d7137"
  name    = "cf2024-1._domainkey"
  type    = "TXT"
  value   = "v=DKIM1; ..."
  ttl     = 1
  proxied = False

  
}

resource "cloudflare_record" "google__domainkey_8" {
  zone_id = "f4b176ccc0a0c9307f69cc17980d7137"
  name    = "google._domainkey"
  type    = "TXT"
  value   = "v=DKIM1; ..."
  ttl     = 1
  proxied = False

  
}

resource "cloudflare_record" "root_9" {
  zone_id = "f4b176ccc0a0c9307f69cc17980d7137"
  name    = "@"
  type    = "TXT"
  value   = "v=spf1 include:_spf.google.com include:_spf.mx.cloudflare.net ~all"
  ttl     = 1
  proxied = False

  
}

resource "cloudflare_record" "cdn_10" {
  zone_id = "f4b176ccc0a0c9307f69cc17980d7137"
  name    = "cdn"
  type    = "CNAME"
  value   = "TODO: your-r2-endpoint.r2.cloudflarestorage.com"
  ttl     = 300
  proxied = True

  
}
