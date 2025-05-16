

# 🌐 Interactive Portfolio on Google Cloud (via Terraform)

This project deploys a static portfolio website to Google Cloud Storage using Terraform. The site is publicly accessible and hosted securely and reliably by Google Cloud infrastructure.

---

## 🚀 Deployment Steps

### Prerequisites
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- [Terraform](https://developer.hashicorp.com/terraform/install)
- A Google Cloud Project (we use: `terraform-projectfzl`)
- Billing enabled and permissions to create Storage resources

---

### 1. Authenticate and Set Project

```bash
gcloud auth login
gcloud config set project terraform-projectfzl
````

---

### 2. Initialize and Deploy with Terraform

```bash
cd portfolio-terraform
terraform init
terraform apply
```

When prompted, type `yes` to confirm resource creation.

---

### 3. Access the Website

After successful deployment, Terraform will output a URL like:

```
http://terraform-projectfzl-portfolio-bucket.storage.googleapis.com/index.html
```

Open that in your browser to view your live portfolio!

---

## 📦 Project Structure

```
portfolio-terraform/
├── main.tf          # Terraform infrastructure definitions
├── variables.tf     # Inputs like project ID and MIME types
├── outputs.tf       # Public website URL
└── website/         # Your static site content (HTML, CSS, JS)
```

---

## 🛠️ GCP Resources Explained

### 1. **Google Storage Bucket (`google_storage_bucket`)**

* Hosts your static files
* Configured for website hosting with:

  * `main_page_suffix = "index.html"`
  * `not_found_page = "404.html"` (optional)

### 2. **IAM Binding (`google_storage_bucket_iam_binding`)**

* Grants `roles/storage.objectViewer` to `allUsers`
* Makes your files publicly accessible on the web

### 3. **Bucket Objects (`google_storage_bucket_object`)**

* Uploads all files from `website/` folder
* Automatically detects MIME types via file extension

---

## 📌 Customization Ideas

* Add a custom domain (via Cloud DNS + CNAME)
* Enable HTTPS via Cloud CDN
* Add CI/CD using GitHub Actions or Cloud Build

---

## 🔐 Note on Security

Your website is public to the internet. Do **not** use this for sensitive/private content unless you configure secure access rules.

---

## 🧹 Cleanup

To delete all resources created:

```bash
terraform destroy
```

---
