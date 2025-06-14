

---

```markdown
# 🌐 DevOps Portfolio Website Deployment Using Terraform on Google Cloud

This project deploys a static HTML website (e.g., your DevOps portfolio) to a public Google Cloud Storage (GCS) bucket using Terraform.

---

## ⚙️ Prerequisites

- Google Cloud account & billing enabled
- Google Cloud SDK (`gcloud`) installed
- Terraform installed (`>=1.0`)
- Application Default Credentials configured:
  
```bash
gcloud auth application-default login
gcloud config set project YOUR_PROJECT_ID
````

---

## 🚀 Deployment Steps

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Preview the deployment

```bash
terraform plan
```

### 3. Apply the changes

```bash
terraform apply
```

Type `yes` when prompted.

---



## 🌍 Access the Website

After `terraform apply`, you'll see the URL output like:

```
website_url = http://your-bucket-name.storage.googleapis.com
```

You can visit this URL in your browser to see the site live.

---

## 🧹 Cleanup

```bash
terraform destroy
```


