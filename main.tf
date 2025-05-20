
provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "portfolio" {
  name          = "amanportfolio1"
  location      = var.region
  force_destroy = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }

  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_binding" "public_access" {
  bucket = google_storage_bucket.portfolio.name
  role    = "roles/storage.objectViewer"
  members = ["allUsers"]
}

resource "google_storage_bucket_object" "static_files" {
  for_each = fileset("${path.module}/website", "**")

  name   = each.value
  bucket = google_storage_bucket.portfolio.name
  source = "${path.module}/website/${each.value}"
  content_type = lookup(var.mime_types, regex("[^.]+$", each.value), "application/octet-stream")
}
