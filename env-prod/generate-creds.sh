az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/d8391944-774c-41db-95d3-6797158258bc"
terraform init 
terraform plan -var-file="creds.tfvars"
terraform apply -var-file="creds.tfvars"