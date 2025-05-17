#!/usr/bin/env bash
set -ex

echo "Devcontainer postCreateCommand executed !"

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -o awscliv2.zip
sudo ./aws/install

# Create folder AWS config
mkdir -p ~/.aws

# Create file credentials with environment variables from github secrets
cat > ~/.aws/credentials << EOF
[default]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
EOF

cat > ~/.aws/config << EOF
[default]
region = eu-west-3
output = json
EOF

# Enable AWS CLI auto-prompt on new sessions
echo "export AWS_CLI_AUTO_PROMPT=on" >> ~/.bashrc


# ---------- INSTALL TERRAFORM ----------
# Add HashiCorp's GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add the official HashiCorp Linux repo
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
  | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Install Terraform
sudo apt-get update && sudo apt-get install -y terraform
