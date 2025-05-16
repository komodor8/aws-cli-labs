#!/bin/bash
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