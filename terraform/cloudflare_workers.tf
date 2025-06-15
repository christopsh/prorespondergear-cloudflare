
resource "cloudflare_worker_script" "my-website-worker" {
  name     = "website-logic"
  content  = file("workers/my-website-worker/index.js")
}


resource "cloudflare_worker_route" "my-website-worker_route_1" {
  zone_id     = "f4b176ccc0a0c9307f69cc17980d7137"
  pattern     = "www.{{ domain_name }}/*"
  script_name = cloudflare_worker_script.my-website-worker.name
}

resource "cloudflare_worker_route" "my-website-worker_route_2" {
  zone_id     = "f4b176ccc0a0c9307f69cc17980d7137"
  pattern     = "{{ domain_name }}/*"
  script_name = cloudflare_worker_script.my-website-worker.name
}



resource "cloudflare_worker_kv_namespace" "my-website-worker_kv" {
  title = "abcde12345fghij67890"
}





resource "cloudflare_worker_script" "serve-r2-assets" {
  name     = "serve-r2-assets"
  content  = file("workers/serve-r2-assets/index.js")
}


resource "cloudflare_worker_route" "serve-r2-assets_route_1" {
  zone_id     = "f4b176ccc0a0c9307f69cc17980d7137"
  pattern     = "cdn.prorespondergear.shop/*"
  script_name = cloudflare_worker_script.serve-r2-assets.name
}

resource "cloudflare_worker_route" "serve-r2-assets_route_2" {
  zone_id     = "f4b176ccc0a0c9307f69cc17980d7137"
  pattern     = "r2.{{ domain_name }}/*"
  script_name = cloudflare_worker_script.serve-r2-assets.name
}





resource "cloudflare_worker_script" "serve-r2-assets_with_r2" {
  name     = "serve-r2-assets"
  content  = file("workers/serve-r2-assets/index.js")

  r2_bucket_binding {
    name = "R2_ASSETS"
    bucket_name = "my-r2-assets"
  }
}


