
output "website_url" {
  value = "http://${google_storage_bucket.portfolio.name}.storage.googleapis.com/index.html"
}
