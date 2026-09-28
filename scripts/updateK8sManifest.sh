```bash
#!/bin/bash
set -e
set -x

# Set the repository URL
REPO_URL="<REDACTED>"

# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Update the Kubernetes manifest image
sed -i "s|image:.*|image: akhileshazcicd/$2:$3|g" "k8s-specifications/$1-deployment.yaml"

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo
```