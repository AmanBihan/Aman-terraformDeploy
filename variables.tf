
variable "project_id" {
  type        = string
  default     = "favorable-valor-460414-m4"
  description = "Your GCP project ID"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "mime_types" {
  type = map(string)
  default = {
    html = "text/html"
    css  = "text/css"
    js   = "application/javascript"
    png  = "image/png"
    jpg  = "image/jpeg"
    jpeg = "image/jpeg"
    svg  = "image/svg+xml"
    ico  = "image/x-icon"
  }
}
