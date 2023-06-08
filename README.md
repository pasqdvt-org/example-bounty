# example-secrets-menagement-bounty

## instructions

1. create a new GitHub user
1. with the current user create a GitHub Organization. Current user will be the GitHub Organization owner
1. fork this repository (https://github.com/pasqdvt-org/example-secrets-menagement-bounty)
1. optionally set branch protection rule on the repository
1. create a second user
1. with the first user (owner) invite the second user to the repository and give it the write permission
1. with the second user accept the invitation to collaborate to the forked repository
1. with the second user clone the forked repository on your machine
1. with the second user create a PAT token with repository permission (all checked)
1. if needed, install terraform on your machine
1. open a cli and go to ```src``` directory
1. change the line 19 with your organization name
3. run the command ```export TF_VAR_github_token="<<CHANGE_WITH_PAT_TOKEN>>"```
4. run the command ```terraform init && terraform apply -auto-approve```
5. with the first user go to repository settings and check the created secrets (CASE 1)
6. with the first user go to repository settings and create an environment named ```environment```
7. with the second user uncomment CASE 2 into terraform.tf file
8. run the command ```terraform init && terraform apply -auto-approve```
9. with the first user go to repository settings and check the created secrets into the ```environment``` (CASE 2)
