# Define variables
$RESOURCE_GROUP="rg-aca-workshop"
$LOCATION="northeurope"
$CONTAINERAPPS_ENVIRONMENT="aca-workshop-environment"
$CONTAINERAPP="aca-workshop-myfirstapp"


# Configure an existing app by adding an environment variable with a manual value
az containerapp update `
    -n $CONTAINERAPP `
    -g $RESOURCE_GROUP `
    --set-env-vars MY_ENVIRONMENTAL_VARIABLE=Test

# Verify the creation of the environment variable
# (1).Open an interactive shell inside the container app to execute commands inside the running container.
az containerapp exec --name $CONTAINERAPP --resource-group $RESOURCE_GROUP

# (2).Type the following command to verify the custom environment variable:
env | grep MY_ENVIRONMENTAL_VARIABLE

# (3).Type the following command to verify the custom environment variable:
env | grep CONTAINER_APP_NAME

# Configure an existing app by adding a secret with a manual value
az containerapp secret set -n $CONTAINERAPP -g $RESOURCE_GROUP --secrets "my-custom-secret=ThisIsAPassword"

# Configure an existing app by adding an environment variable with a secret value
az containerapp update `
    -n $CONTAINERAPP `
    -g $RESOURCE_GROUP `
    --set-env-vars MY_CUSTOM_SECRET_ENV_VAR=secretref:my-custom-secret

# Verify the creation of the environment variable with the secret reference
# (1).Open an interactive shell inside the container app to execute commands inside the running container.
az containerapp exec --name $CONTAINERAPP --resource-group $RESOURCE_GROUP

# (2).Type the following command to verify the custom environment variable secret:
env | grep MY_CUSTOM_SECRET_ENV_VAR

# For instructions how to create =, manage and reference secrets from Key vault as environment variables or volume mount secrets, use the following link: 
# https://learn.microsoft.com/en-us/azure/container-apps/manage-secrets?tabs=azure-portal#reference-secret-from-key-vault

# Configure an existing app by adding a secret with a key vault reference
az containerapp secret set -n $CONTAINERAPP -g $RESOURCE_GROUP --secrets "queue-connection-string=keyvaultref:<KEY_VAULT_SECRET_URI>,identityref:<USER_ASSIGNED_IDENTITY_ID>"

az containerapp secret set -n $CONTAINERAPP -g $RESOURCE_GROUP --secrets "my-custom-keyvault-secret=keyvaultref:https://aca-workshop-keyvault.vault.azure.net/secrets/my-custom-keyvault-secret,identityref:/subscriptions/94bc45db-2c21-4a0e-a881-762c4d44751a/resourcegroups/rg-aca-workshop/providers/microsoft.managedidentity/userassignedidentities/key_vault_managed_identity_ne"


# Configure an existing app by adding an environment variable with a secret value
az containerapp update `
    -n $CONTAINERAPP `
    -g $RESOURCE_GROUP `
    --set-env-vars MY_CUSTOM_SECRET_ENV_VAR=secretref:my-custom-secret