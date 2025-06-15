variable "cloudflare_zone_id" {
  description = "The Cloudflare Zone ID for your domain"
  type        = string
}

variable "cloudflare_account_id" {
  description = "Your Cloudflare Account ID"
  type        = string
}

variable "domain_name" {
  description = "The root domain for your website"
  type        = string
}

variable "r2_bucket_name" {
  description = "The name of the Cloudflare R2 bucket"
  type        = string
  default     = "my-website-assets"
}

variable "r2_backup_bucket" {
  description = "Optional second bucket for backups"
  type        = string
  default     = "backups"
}

variable "r2_location" {
  description = "R2 bucket region"
  type        = string
  default     = "WNAM"
}

variable "worker_script_paths" {
  description = "Map of worker names to file paths"
  type        = map(string)
  default     = {
    "my-website-worker"     = "workers/my-website-worker/index.js"
    "serve-r2-assets"       = "workers/serve-r2-assets/index.js"
  }
}

variable "tunnel_secrets" {
  description = "Map of Cloudflare tunnel names to secrets"
  type        = map(string)
  default     = {
    production_web = "REPLACE_WITH_BASE64_SECRET"
    staging_api    = "REPLACE_WITH_BASE64_SECRET"
  }
}

variable "admin_emails" {
  description = "List of admin emails for access policy"
  type        = list(string)
  default     = [
    "admin@prorespondergear.shop",
    "devteam@prorespondergear.shop"
  ]
}
