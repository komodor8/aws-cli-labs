set -e

echo "Devcontainer postCreateCommand exécuté !"

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Create folder AWS config
mkdir -p ~/.aws

# Create file credentials with environment variables
echo -e "[default]\naws_access_key_id=$AWS_ACCESS_KEY_ID\naws_secret_access_key=$AWS_SECRET_ACCESS_KEY" > ~/.aws/credentials
echo -e "[default]\nregion=eu-west-3" > ~/.aws/config