A stand-alone terraform module to create a shared remote statefile in AWS.

Assumptions: AWS is already configured on CI runner or developer workstation.

```
git checkout tags/step1
#modify bucket name and dynamodb table name to suit
terraform init
terraform plan -out step1.plan
terraform apply "step1.plan"
git checkout tags/step2
terraform init
#answer 'yes'
terraform plan -out step2.plan
terraform apply "step2.plan"
```
