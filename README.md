

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

```bash
terraform destroy
```

---


### CI/CD with Google Cloud Build**

You can automate deployments to your portfolio bucket whenever changes are pushed to your repository.

---

## ⚙️ Steps to Set Up Cloud Build CI/CD

### 1. Enable APIs

Make sure these are enabled for your project:

```bash
gcloud services enable cloudbuild.googleapis.com
gcloud services enable storage.googleapis.com
```

---

### 2. Create a Cloud Build Service Account IAM Binding

Grant the Cloud Build service account permission to manage storage objects:

```bash
PROJECT_ID=terraform-projectfzl
CLOUD_BUILD_SA="service-${PROJECT_NUMBER}@gcp-sa-cloudbuild.iam.gserviceaccount.com"

gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member="serviceAccount:$CLOUD_BUILD_SA" \
  --role="roles/storage.admin"
```

> You can find your `PROJECT_NUMBER` by running:
>
> ```bash
> gcloud projects describe terraform-projectfzl --format="value(projectNumber)"
> ```

---

### 3. Add a `cloudbuild.yaml` to Project Root

Create a file named `cloudbuild.yaml`:

```yaml
steps:
  - name: 'hashicorp/terraform:light'
    entrypoint: 'sh'
    args:
      - '-c'
      - |
        terraform init
        terraform apply -auto-approve

options:
  logging: CLOUD_LOGGING_ONLY
```

---

### 4. Push to GitHub (or other repo) & Connect to Cloud Build

1. Go to **Cloud Console → Cloud Build → Triggers**
2. Click **Create Trigger**
3. Choose:

   * Your source repo (GitHub/GitLab/Cloud Source)
   * Event: Push to `main` branch
   * Directory: `/` (or path to your Terraform setup)
   * Cloud Build config file: `cloudbuild.yaml`
4. Click **Create**

---

### ✅ Done!

Now whenever you push changes to your repo’s `main` branch, Cloud Build will:

* Automatically run Terraform to apply any changes.
* Update your Google Cloud Storage bucket and redeploy the site.

---


