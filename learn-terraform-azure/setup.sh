az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/$subscriptionId" -n $spName

export ARM_CLIENT_ID="<APPID_VALUE>"
export ARM_CLIENT_SECRET="<PASSWORD_VALUE>"
export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
export ARM_TENANT_ID="<TENANT_VALUE>"

terraform init
# We recommend using consistent formatting in all of your configuration files. 
# The terraform fmt command automatically updates configurations in the current directory for readability and consistency.

# Format your configuration. Terraform will print out the names of the files it modified, if any. 
# In this case, your configuration file was already formatted correctly, so Terraform won't return any file names.
terraform fmt
terraform validate
terraform apply

terraform show
terraform state list